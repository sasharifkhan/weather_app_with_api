import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_with_api2/api_calling.dart';

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.white),
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiCalling().getweatherDetailsForecast(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.black,
              child: Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 125,
                      width: 125,
                      child: Image(
                        image: NetworkImage(
                          'https:${snapshot.data![1].day.condition.icon}',
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tomorrow",
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                        Text(
                          snapshot.data![1].day.condition.text,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          "${snapshot.data![1].day.avgtempC.toString()}°",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Temp",
                          style: TextStyle(fontSize: 16, color: Colors.white60),
                        ),
                        Text(
                          "${snapshot.data![1].day.avgtempC.toString()}°",
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Wind",
                          style: TextStyle(fontSize: 16, color: Colors.white60),
                        ),
                        Text(
                          "${snapshot.data![1].day.maxwindKph.toString()}km/h",
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Humidity",
                          style: TextStyle(fontSize: 16, color: Colors.white60),
                        ),
                        Text(
                          "${snapshot.data![1].day.avghumidity.toString()}%",
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "In 3 Days",
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                SizedBox(
                  height: 320,
                  child: ListView.separated(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      DateTime date = snapshot.data![index].date;
                      String weekday = DateFormat('EEEE').format(date);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            weekday,
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 44,
                                width: 44,
                                child: Image(
                                  image: NetworkImage(
                                    'https:${snapshot.data![index].day.condition.icon}',
                                  ),
                                ),
                              ),
                              Text(
                                snapshot.data![index].day.condition.text,
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "+14°",
                            style: TextStyle(color: Colors.white, fontSize: 28),
                          ),
                          Text(
                            "${snapshot.data![index].day.maxwindMph.toString()}km/h",
                            style: TextStyle(color: Colors.white, fontSize: 28),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        Divider(height: 10, color: Colors.transparent),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
