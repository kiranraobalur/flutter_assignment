import 'dart:developer';

import 'package:bike_order_system/auth/auth_service.dart';
import 'package:bike_order_system/auth/signup_screen.dart';
import 'package:bike_order_system/bikescreens/bike_list.dart';
import 'package:bike_order_system/bikescreens/upload_bikes.dart';
import 'package:bike_order_system/bikescreens/checkout_screen.dart';
import 'package:bike_order_system/home_screen.dart';
import 'package:bike_order_system/widgets/button.dart';
import 'package:bike_order_system/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';


class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>{
  final auth = AuthService();

  final email = TextEditingController();
  final password = TextEditingController();
  

  @override
  void dispose(){
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context){
    return(
      Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const Spacer(),
            const Text("Welcome to Bike order system",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(height: 50),
            const Text("Login",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500)),
            const SizedBox(height: 50),
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
            const SizedBox(height: 30),
            CustomButton(
              label: "Login",
              onPressed: login,
            ),
            const SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Already have an account? "),
              InkWell(
                onTap: () => goToSignup(context),
                child:
                    const Text("Signup", style: TextStyle(color: Colors.red)),
              )
            ]),
            const Spacer()
          ],
        ),
      ),)
    );
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );

  // goToHome(BuildContext context) => Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const BikeList()),
  //     );
  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BikeList()),
      );

  login() async {
    if(email.text == ""){
      showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text("Error..!"),
                content: const Text("Please enter email."),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx) .pop();
                    },
                    child: const Text("okay"),
                  ),
                ],
              ),
            );
    }
    else if(password.text == ""){
      showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text("Error..!"),
                content: const Text("Please enter password."),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text("okay"),
                  ),
                ],
              ),
            );
    }
    else{
    final user =
        await auth.loginUserWithEmailAndPassword(email.text, password.text);

    if (user != null) {
      log("User Logged In");
      goToHome(context);
       savedata(email.text);
    }
    else{
      // Show an alert dialog when the button is pressed
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text("Error..!"),
                content: const Text("Username or password is wrong."),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text("okay"),
                  ),
                ],
              ),
            );
    }
  }
}

savedata(String email) async{
final prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', email);

  final counter = prefs.getString('user') ?? "empty";
  print(counter);
}
  
}