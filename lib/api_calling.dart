import 'dart:convert';
import 'package:http/http.dart' as http ;


class ApiCalling {

    getweatherDetails()async {
      String q = 'Dhaka';
      final response = await http.get(Uri.parse('http://api.weatherapi.com/v1/current.json?key=72e7e4f689134be0b3640336252309&q=$q'));
      int responseStatusCode = response.statusCode;
      if (response.statusCode==200){
        final jsonData = jsonDecode(response.body);
        final tempC=  jsonData['current']['temp_c'].toString();
        final location=  jsonData['location']['name'].toString();
        final localTime=  jsonData['location']['localtime'].toString();
        final tempIcon=  jsonData['current']['condition']['icon'].toString();
        final tempText=  jsonData['current']['condition']['text'].toString();
        final windKmph=  jsonData['current']['wind_kph'].toString();
        final humidity=  jsonData['current']['humidity'].toString();
        final feelslikeTempC=  jsonData['current']['feelslike_c'].toString();
        print('tempC: $tempC');
        print('location: $location');
        print('localTime: $localTime');
        print('tempicon: $tempIcon');
        print('tempText $tempText');
        print('windkmph: $windKmph');
        print('humidity: $humidity');
        print('feelslikeTempc: $feelslikeTempC');
      } else{
        print('Error $responseStatusCode');
      }


    }

}