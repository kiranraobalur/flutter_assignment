import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CheckoutScreen extends StatefulWidget{
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => CheckoutScreenState();
}

class CheckoutScreenState extends State<CheckoutScreen>{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String namee='',age='',email='',address='', mobile='';
  String company='',model='',desc='',prices = '0';
  int taxamt = 0, totalprice = 0;

  

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      namee = prefs.getString('name') ?? '';
      email = prefs.getString('email') ?? '';
      address = prefs.getString('address') ?? '';
      mobile = prefs.getString('mobile') ?? '';

      company = prefs.getString('company') ?? '';
      model = prefs.getString('model') ?? '';
      prices = prefs.getString('price') ?? '0';
      desc = prefs.getString('desc') ?? '';

      int price  = int.parse(prices);
      taxamt = price;
      totalprice = price + taxamt;
      
  
    });
  }

  // Future<void> _incrementCounter() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
      
  //   });
  // }
  

  @override
  Widget build(BuildContext context){

    int price  = int.parse(prices);
      taxamt = (price ~/10) * 3;
      totalprice = price + taxamt;
    return Scaffold(
      appBar: AppBar(title: Text('Checkout'),),
      body: Column(
        children: [
          const Spacer(),
          const Text("Check Out",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
            const SizedBox(height: 50),
            const Text("Order Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(height: 30),
          Row(
            children:[
              const SizedBox(width: 20),
              Text(
                'Price',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 50),
              Text(
                prices,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children:[
              const SizedBox(width: 20),
              Text(
                'Company',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 50),
              Text(
                company,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children:[
              const SizedBox(width: 20),
              Text(
                'Model',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 50),
              Text(
                model,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children:[
              const SizedBox(width: 20),
              Text(
                'Tax Amount',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 50),
              Text(
                '$taxamt',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children:[
              const SizedBox(width: 20),
              Text(
                'Total Amount',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 50),
              Text(
                '$totalprice',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 50),
            const Text("Delivery Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(height: 30),
            const SizedBox(height: 20),
          Row(
            children:[
              const SizedBox(width: 20),
              Text(
                'User',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 50),
              Text(
                'userename',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children:[
              const SizedBox(width: 20),
              Text(
                'Email',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 50),
              Text(
                email,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children:[
              const SizedBox(width: 20),
              Text(
                'Mobile',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 50),
              Text(
                mobile,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children:[
              const SizedBox(width: 20),
              Text(
                'Delivery Address',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 50),
              Text(
                address,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 20),
            ],
          ),
          const Spacer(),
        ],
      )
    );
  }

  getData() async{
    final prefs = await SharedPreferences.getInstance();
    namee = prefs.getString('user') ?? "empty";
    email = prefs.getString('address') ?? "empty";
  }
}