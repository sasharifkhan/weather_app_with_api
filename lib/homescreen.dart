import 'package:flutter/material.dart';
import 'package:weather_app_with_api2/fullreport.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 26, 38),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 26, 38),
        automaticallyImplyLeading: false,
        leading: Icon(Icons.menu,color: Colors.white,),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.sunny,color: Colors.white,)), IconButton(onPressed: (){}, icon: Icon(Icons.bedtime_outlined,color: Colors.blue,))],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text("Toronto Ontario",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.w500),),
            Text("Today, 26 Jul",style: TextStyle(fontSize: 16,color: Colors.white60),),
            SizedBox(height: 250, width: 250, child: Image(image: NetworkImage("https://cdn-icons-png.flaticon.com/512/6974/6974845.png"))),
            Text("36°",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: Colors.white),),
            Text("Thunder Overcast",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.w500),),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Column(children: [
                Text("Temp",style: TextStyle(color: Colors.white60,fontSize: 18),),
                Text("28°",style: TextStyle(color: Colors.white,fontSize: 25),)
              ],),
              Column(children: [
                Text("Wind",style: TextStyle(color: Colors.white60,fontSize: 18),),
                Text("13km/h",style: TextStyle(color: Colors.white,fontSize: 25),)
              ],),
              Column(children: [
                Text("Humidity",style: TextStyle(color: Colors.white60,fontSize: 18),),
                Text("84%",style: TextStyle(color: Colors.white,fontSize: 25),)
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