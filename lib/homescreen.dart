import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_with_api2/api_calling.dart';
import 'package:weather_app_with_api2/fullreport.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  String? temp_c;
  String? location_name;
  String? localtime;
  String? tempIcon;
  String? tempText;
  String? wind_kph;
  String? humidity;
  String? feelslike_c;

  @override
  void initState(){
    super.initState();
    fetchweather();
  }
  
    void fetchweather()async{
    var data = await ApiCalling().getweatherDetails();
    setState(() {
      temp_c = data['temp_c'];
      location_name = data['location_name'];
      localtime = data['localtime'];
      tempIcon = data['tempIcon'];
      tempText = data['tempText'];
      wind_kph = data['wind_kph'];
      humidity = data['humidity'];
      feelslike_c = data['feelslike_c'];
    });
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 26, 38),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 26, 38),
        automaticallyImplyLeading: false,
        leading: Icon(Icons.menu,color: Colors.white,),
        actions: [
          Switch(dragStartBehavior: DragStartBehavior.start , value: false, onChanged: null)
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text('$location_name',style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.w500),),
            Text("Today, 26 Jul",style: TextStyle(fontSize: 16,color: Colors.white60),),
            SizedBox(height: 200, width: 200, child: Image(image: NetworkImage("https://cdn-icons-png.flaticon.com/512/6974/6974845.png"))),
            Text("$feelslike_c",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: Colors.white),),
            Text("$tempText",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.w500),),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Column(children: [
                Text("Temp",style: TextStyle(color: Colors.white60,fontSize: 18),),
                Text("$temp_c°",style: TextStyle(color: Colors.white,fontSize: 25),)
              ],),
              Column(children: [
                Text("Wind",style: TextStyle(color: Colors.white60,fontSize: 18),),
                Text("$wind_kph km/h",style: TextStyle(color: Colors.white,fontSize: 25),)
              ],),
              Column(children: [
                Text("Humidity",style: TextStyle(color: Colors.white60,fontSize: 18),),
                Text("$humidity%",style: TextStyle(color: Colors.white,fontSize: 25),)
              ],)
            ],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("Today",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.w500)),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Fullreport(),));
              }, child: Text("View Full Report",style: TextStyle(fontSize: 16,color: Colors.lightBlue,fontWeight: FontWeight.w500),))
            ],),
            SizedBox(
              height: 100,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    SizedBox(height: 44, width: 44, child: Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/6974/6974845.png'))),
                    Text("2:00 AM",style: TextStyle(fontSize: 10,color: Colors.white60),),
                    Text("36°",style: TextStyle(fontSize: 28,color: Colors.white60))
                  ],),
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    SizedBox(height: 44, width: 44, child: Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/6974/6974845.png'))),
                    Text("2:00 AM",style: TextStyle(fontSize: 10,color: Colors.white60),),
                    Text("36°",style: TextStyle(fontSize: 28,color: Colors.white60))
                  ],),
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    SizedBox(height: 44, width: 44, child: Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/6974/6974845.png'))),
                    Text("2:00 AM",style: TextStyle(fontSize: 10,color: Colors.white60),),
                    Text("36°",style: TextStyle(fontSize: 28,color: Colors.white60))
                  ],),
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    SizedBox(height: 44, width: 44, child: Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/6974/6974845.png'))),
                    Text("2:00 AM",style: TextStyle(fontSize: 10,color: Colors.white60),),
                    Text("36°",style: TextStyle(fontSize: 28,color: Colors.white60))
                  ],),
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    SizedBox(height: 44, width: 44, child: Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/6974/6974845.png'))),
                    Text("2:00 AM",style: TextStyle(fontSize: 10,color: Colors.white60),),
                    Text("36°",style: TextStyle(fontSize: 28,color: Colors.white60))
                  ],)
              ],)
            )
          ],),
        ),
      ),
    );
  }
}