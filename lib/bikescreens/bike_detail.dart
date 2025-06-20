import 'dart:developer';
import 'package:bike_order_system/bikescreens/bike_list.dart';
import 'package:bike_order_system/models/bikeModels.dart';
import 'package:flutter/material.dart';
import 'package:bike_order_system/widgets/button.dart';
import 'package:bike_order_system/home_screen.dart';

class BikeDetail extends StatelessWidget{
  final BikeModels bikeModel;
  const BikeDetail({Key? key, required this.bikeModel}):super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(this.bikeModel.company),),
      body: Column(
        children: [
          Image.network(bikeModel.urls),
          Text(bikeModel.description),
          // const SizedBox(height: 30),
          //   CustomButton(
          //     label: "Login",
          //     onPressed: goToHome(context),
          //   ),
        ],
      ),
    );
  }

  // goToHome(BuildContext context) => Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const BikeList()),
  //     );
  
}
