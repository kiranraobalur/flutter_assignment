import 'package:bike_order_system/bikescreens/bike_detail.dart';
import 'package:bike_order_system/bikescreens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:bike_order_system/models/bikeModels.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BikeList extends StatefulWidget{
  const BikeList({super.key});
  @override
  State<BikeList> createState() => BikeListState();
}

class BikeListState extends State<BikeList>{

static List<String> company = ['Bajaj','Suzuki','Hero','Honda','Yamaha'];
static List<String> model = ['Pulsar','Gixxer','Splendor','Shine','Facino'];
static List<String> price = ['1500','1500', '1000', '1200', '1300'];
static List<String> description = ['Low mentanance','Good Service','Versatile','Mileage','Quality'];
static List<String> urls = ['https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg',
'https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg',
'https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg',
'https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg',
'https://images.pexels.com/photos/276517/pexels-photo-276517.jpeg'];

final List<BikeModels> bikeList = List.generate(company.length, (index) => BikeModels('${company[index]}',
'${model[index]}','${price[index]}','${description[index]}','${urls[index]}'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bike world'),),
      body: ListView.builder(
        itemCount: bikeList.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              title: Text(bikeList[index].company),
              leading: SizedBox(
                width: 150,
                height: 150,
                child: Image.network(bikeList[index].urls)      
              ),
              onTap: (){
                savedata(bikeList[index].company, bikeList[index].model, bikeList[index].price, bikeList[index].description);
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BikeDetail(bikeModel: bikeList[index])));
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CheckoutScreen()));
              },
            ),
          );
        },

      )
    );
  }

  savedata(String company, String model, String price, String desc) async{
final prefs = await SharedPreferences.getInstance();
  await prefs.setString('company', company);
  await prefs.setString('model', model);
  await prefs.setString('price', price ?? '0');
  await prefs.setString('desc', desc);

}

}