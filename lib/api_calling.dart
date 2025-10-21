import 'dart:convert';
import 'package:http/http.dart' as http ;
import 'package:intl/intl.dart';


class ApiCallingCurrent {

    Future<Map<String, String>> getweatherDetails()async {
      
      String q = 'Dhaka';
      final response = await http.get(Uri.parse('http://api.weatherapi.com/v1/current.json?key=72e7e4f689134be0b3640336252309&q=$q'));
      if (response.statusCode==200){
        final jsonData = jsonDecode(response.body);
        String localtimeStr =  jsonData['location']['localtime'].toString();
        DateTime dateTime = DateTime.parse(localtimeStr);
        String localDate =  DateFormat('d MMM').format(dateTime);



        return{
        'temp_c':  jsonData['current']['temp_c'].toString(),
        'location_name' :  jsonData['location']['name'].toString(),
        'localtime':  localDate,
        'tempIcon': jsonData['current']['condition']['icon'].toString(),
        'tempText': jsonData['current']['condition']['text'].toString(),
        'wind_kph':  jsonData['current']['wind_kph'].toString(),
        'humidity':  jsonData['current']['humidity'].toString(),
        'feelslike_c' :  jsonData['current']['feelslike_c'].toString()
        };

      } else{
        print('Error ${response.statusCode}');
        return{};
      }


    }

}

class ApiCallingForecast{
  getweatherDetailsForecast()async {
    final response = await http.get(Uri.parse('http://api.weatherapi.com/v1/forecast.json?key=72e7e4f689134be0b3640336252309&q=Dhaka&days=7'));
    if (response.statusCode == 200){
      final jsonData = jsonDecode(response.body);
      print(jsonData);
    }
  }


}