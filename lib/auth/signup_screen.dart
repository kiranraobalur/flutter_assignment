import 'dart:developer';

import 'package:bike_order_system/auth/auth_service.dart';
import 'package:bike_order_system/auth/login_screen.dart';
import 'package:bike_order_system/bikescreens/bike_list.dart';
import 'package:bike_order_system/home_screen.dart';
import 'package:bike_order_system/widgets/button.dart';
import 'package:bike_order_system/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget{
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen>{
  final auth = AuthService();
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final address = TextEditingController();
  final mobile = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    name.dispose();
    email.dispose();
    password.dispose();
    address.dispose();
    mobile.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            
            const Spacer(),
            const Text("Signup",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              hint: "Enter Name",
              label: "Name",
              controller: name,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Enter Email",
              label: "Email",
              controller: email,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Enter Password",
              label: "Password",
              isPassword: true,
              controller: password,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Enter Address",
              label: "Address",
              isPassword: false,
              controller: address,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hint: "Mobile",
              label: "Mobile",
              isPassword: false,
              controller: mobile,
            ),
            const SizedBox(height: 30),
            CustomButton(
              label: "Signup",
              onPressed: signup,
            ),
            const SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Already have an account? "),
              InkWell(
                onTap: () => goToLogin(context),
                child: const Text("Login", style: TextStyle(color: Colors.red)),
              )
            ]),
            const Spacer()
          ],
        ),
        ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));

  goToHome(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => BikeList()));

  signup() async{

    //  FirebaseFirestore.instance
    //             .collection('user')
    //             .add({'username': name.text,
    //             'email': email.text,
    //             'age':'30',
    //             'address': address.text});
    final user = await auth.createUserWithEmailAndPassword(email.text, password.text);

    if(user != null){
      log("User Created Successsfully");
      // goToHome(context);
      goToLogin(context);
    }
  }

  savedata(String name, String email, String address, String age) async{
final prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', name);
  await prefs.setString('email', email);
  await prefs.setString('age', age);
  await prefs.setString('address', address);
  await prefs.setString('mobile', '$mobile');
}
  
}