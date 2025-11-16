// ignore_for_file: non_constant_identifier_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_with_api2/api_calling.dart';
import 'package:weather_app_with_api2/fullreport.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 26, 38),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 26, 38),
        automaticallyImplyLeading: false,
        leading: Icon(Icons.menu, color: Colors.white),
        actions: [
          Switch(
            dragStartBehavior: DragStartBehavior.start,
            value: false,
            onChanged: null,
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiCalling().getweatherDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.black,
              child: Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            );
          }
          DateTime dateTime = DateTime.parse(snapshot.data!.location.localtime);
          String localDate = DateFormat('d MMM').format(dateTime);
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Text(
                      snapshot.data!.location.name,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Today, $localDate",
                      style: TextStyle(fontSize: 16, color: Colors.white60),
                    ),
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Image(
                        image: NetworkImage(
                          "https:${snapshot.data!.current.condition.icon}",
                        ),
                      ),
                    ),
                    Text(
                      "${snapshot.data!.current.tempC.toString()}°",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      snapshot.data!.current.condition.text,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Temp",
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "${snapshot.data!.current.tempC.toString()}°",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Wind",
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "${snapshot.data!.current.windKph.toString()} km/h",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Humidity",
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "${snapshot.data!.current.humidity.toString()}%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Today",
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Fullreport(),
                              ),
                            );
                          },
                          child: Text(
                            "View Full Report",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 100,
                      child: FutureBuilder(
                        future: ApiCalling().getweatherDetailsForecast(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          }
                          return ListView.builder(
                            itemExtent: 70,
                            shrinkWrap: true,
                            itemCount: snapshot.data![0].hour.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              String dateTimeString =
                                  snapshot.data![0].hour[index].time;
                              String onlyTime = dateTimeString.split(" ")[1];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 44,
                                    width: 44,
                                    child: Image(
                                      image: NetworkImage(
                                        'https:${snapshot.data![0].hour[index].condition.icon}',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    onlyTime,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white60,
                                    ),
                                  ),
                                  Text(
                                    "${snapshot.data![0].hour[index].tempC}°",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white60,
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
