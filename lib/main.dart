import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Razorpay razorpay = Razorpay();

  @override
  void initState() {
    razorpay=Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, success);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, error);
    super.initState();
  }

  void getpayment()
  {
    var options={
      'key': 'rzp_live_LKDVCGWfbrCoO5',
      'amount': '5000',
      'name': '*******',
      'discreption' : 'સબસ્ક્રિપ્શન ગુજરાતની ગરિમા',
      'timeout' : 600,
      'prefill' : {
        'email' : 'jiojhoah@gmail.com',
      }
    };
    razorpay.open(options);
  }

  void success(PaymentSuccessResponse res) async
  {
    print("Successfully Payment");
  }

  void error(PaymentFailureResponse res)
  {
    print("Payment Fail");
  }
  
   @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Razorpay',style: TextStyle(fontSize: 15),),
      ),
      body: Center(
        child: Container(
          height: 45,
          width: 300,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.1)
          ),
          child: OutlinedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: ()async{
              getpayment();
            },
            child: const Text("Click here to purchase a subscription.",style: TextStyle(color: Colors.white),))
        ),
      ),
    );
  }
}
