import 'dart:convert';
import 'package:http/http.dart' as http ;


class ApiCalling {

    gettempC_logation()async {
      final response = await http.get(Uri.parse('http://api.weatherapi.com/v1/current.json?key=72e7e4f689134be0b3640336252309&q=Bangladesh'));
      final jsonData = jsonDecode(response.body);
      final tempC=  jsonData['current']['temp_c'].toString();
      final location=  jsonData['location']['name'].toString();
      final tempIcon=  jsonData['current']['condition']['icon'].toString();
      final tempText=  jsonData['current']['condition']['text'].toString();
      final windKmph=  jsonData['current']['wind_kph'].toString();
      final humidity=  jsonData['current']['humidity'].toString();
      final feelslikeTempC=  jsonData['current']['feelslike_c'].toString();
      print('tempC: $tempC');
      print('location: $location');
      print('tempicon: $tempIcon');
      print('tempText $tempText');
      print('windkmph: $windKmph');
      print('humidity: $humidity');
      print('feelslikeTempc: $feelslikeTempC');

    }

}