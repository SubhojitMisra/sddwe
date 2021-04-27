import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';
import 'package:payment_and_cart/authentication/flutterfire.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Razorpay razorpay;
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckOut() {
    var options = {
      "key": "rzp_test_q7ESSlnz9m1iOr",
      "amount": num.parse(_textEditingController.text) * 100,
      "name": "Payment Desk",
      "description": "Payment for the medicines",
      "subcription_id": "sub_GtYNCes8bj1PLg",
      //"recurring": false,
      "prefill": {
        "contact": "8296104545",
        "email": "jweipfowefuwbf@gmail.com",
      },
      "external": {
        "wallet": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print("Payment Success");
    Toast.show("Payment Success", context);
  }

  void handlerErrorFailure() {
    print("Payment Error");
    Toast.show("Payment Error", context);
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Toast.show("External Wallet", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment for medicines"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(hintText: "Amount To Be Paid"),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
              ),
              onPressed: () async {
                openCheckOut();
                await addCoin(_textEditingController.text);
              },
              child: Text("Pay Now"),
            )
          ],
        ),
      ),
    );
  }
}
