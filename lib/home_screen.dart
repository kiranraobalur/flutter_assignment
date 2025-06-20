import 'package:bike_order_system/auth/auth_service.dart';
import 'package:bike_order_system/auth/login_screen.dart';
import 'package:bike_order_system/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:bike_order_system/models/catalog.dart';
import 'package:bike_order_system/widgets/itemWidget.dart';


class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context){
    final auth = AuthService();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome to the bike world"),
        ),

        body: ListView.builder(
          itemCount: CatalogModel.items.length,
          
          itemBuilder: (context,index){

          return ItemWidget(
            item: CatalogModel.items[index],
            
          );
        }
        
        ),
      ),
    );
    //   Scaffold(body: Align(
    //     alignment: Alignment.center,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const Text(
    //           "Welcome User",
    //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    //         ),
    //         const SizedBox(height: 20),
    //         CustomButton(
    //           label: "Sign Out",
    //           onPressed: () async {
    //             await auth.signout();
    //             goToLogin(context);
    //           },
    //         )
    //       ],
    //     ),
    //   ),)
    // );
  }
  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
}