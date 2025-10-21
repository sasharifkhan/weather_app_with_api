import 'package:flutter/material.dart';

class Fullreport extends StatefulWidget {
  const Fullreport({super.key});

  @override
  State<Fullreport> createState() => _FullreportState();
}

class _FullreportState extends State<Fullreport> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 26, 38),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 26, 38),
        foregroundColor: Colors.white,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.settings,color: Colors.white,))],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(height: 125, width: 125, child: Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/6974/6974845.png'))),
            SizedBox(width: 15,),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Tomorrow",style: TextStyle(color: Colors.white,fontSize: 28),),
              Text("Rain Shower",style: TextStyle(color: Colors.white,fontSize: 16),),
              Text("28°",style: TextStyle(color: Colors.white,fontSize: 48,fontWeight: FontWeight.w600),),
            ],)
          ],),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("Temp",style: TextStyle(fontSize: 16,color: Colors.white60),),
              Text("28°",style: TextStyle(fontSize: 28,color: Colors.white),)
            ],),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("Wind",style: TextStyle(fontSize: 16,color: Colors.white60),),
              Text("12km/h",style: TextStyle(fontSize: 28,color: Colors.white),)
            ],),
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text("Humidity",style: TextStyle(fontSize: 16,color: Colors.white60),),
              Text("72%",style: TextStyle(fontSize: 28,color: Colors.white),)
            ],)
          ],),
          Text("In 7 Days",style: TextStyle(color: Colors.white,fontSize: 28),),
          SizedBox(height: 320, child: ListView.separated(itemBuilder: (context, index) {
            return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Tue",style: TextStyle(color: Colors.white60,fontSize: 20),),
              Row(children: [SizedBox(height: 44, width: 44, child: Image(image: NetworkImage('https://cdn-icons-png.flaticon.com/512/6974/6974845.png'))),
              Text("Rainy",style: TextStyle(color: Colors.white60,fontSize: 20))],),
              Text("+14°",style: TextStyle(color: Colors.white,fontSize: 28)),
              Text("32km/h",style: TextStyle(color: Colors.white,fontSize: 28))
            ],);
            
          }, separatorBuilder: (context, index) => Divider(height: 10,color: Colors.transparent,), itemCount: 6),)
        ],),
      ),
    );
  }
}