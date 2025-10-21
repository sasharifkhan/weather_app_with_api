import 'dart:convert';
import 'package:http/http.dart' as http ;


class ApiCalling {

    Future<Map<String, String>> getweatherDetails()async {
      String q = '48.8567,2.3508';
      final response = await http.get(Uri.parse('http://api.weatherapi.com/v1/current.json?key=72e7e4f689134be0b3640336252309&q=$q'));
      if (response.statusCode==200){
        final jsonData = jsonDecode(response.body);
        return{
        'temp_c':  jsonData['current']['temp_c'].toString(),
        'location_name' :  jsonData['location']['name'].toString(),
        'localtime':  jsonData['location']['localtime'].toString(),
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