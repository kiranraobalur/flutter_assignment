import 'dart:developer';

import 'package:bike_order_system/auth/auth_service.dart';
import 'package:bike_order_system/auth/login_screen.dart';
import 'package:bike_order_system/home_screen.dart';
import 'package:bike_order_system/widgets/button.dart';
import 'package:bike_order_system/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class UploadBikes extends StatefulWidget{
  const UploadBikes({super.key});

  @override
  State<UploadBikes> createState() => UploadBikesState();
}

class UploadBikesState extends State<UploadBikes>{
  final auth = AuthService();
  final company = TextEditingController();
  final model = TextEditingController();
  final imageurl = TextEditingController();
  final price = TextEditingController();
  final desc = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    company.dispose();
    model.dispose();
    imageurl.dispose();
    price.dispose();
    desc.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Upload Screen"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            
            const Spacer(),
            const Text("Upload Bike Details",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              hint: "Company",
              label: "Company Name",
              controller: company,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Model",
              label: "Model Name",
              controller: model,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Image Url",
              label: "Image",
              controller: imageurl,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Price",
              label: "Enter Price",
              controller: price,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Description",
              label: "Enter Description",
              controller: desc,
            ),
            const SizedBox(height: 30),
            CustomButton(
              label: "Upload",
              onPressed: Upload,
            ),
            
            const Spacer()
          ],
        ),
        ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));

  goToHome(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

  Upload() async{

     FirebaseFirestore.instance
                .collection('bikes')
                .add({'company': company.text,
                'model': model.text,
                'imageurl':imageurl.text,
                'price': price.text,
                'desc': desc.text});
                dispose();
  }
  
}