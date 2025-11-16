import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app_with_api2/models/currentweathermodel.dart';
import 'package:weather_app_with_api2/models/forecastmodel.dart';

class ApiCalling {
  // String q = '47.8567,2.0508';
  // String q = 'Dhaka';
  String key = '72e7e4f689134be0b3640336252309';
  String path = 'current.json';

  Future<Currentweathermodel?> getweatherDetails(String q) async {
    if (q == "null,null") {
      q = "Dhaka";
    }

    try {
      final response = await http.get(
        Uri.parse('http://api.weatherapi.com/v1/$path?key=$key&q=$q'),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return Currentweathermodel.fromJson(jsonData);
      }
    } catch (e) {
      final response = await http.get(
        Uri.parse('http://api.weatherapi.com/v1/$path?key=$key&q=$q'),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return Currentweathermodel.fromJson(jsonData);
      }
    }
    return null;
  }

  Future<List<Forecastmodel>?> getweatherDetailsForecast(String q) async {
    if (q == "null,null") {
      q = "Dhaka";
    }
    try {
      final response = await http.get(
        Uri.parse(
          'http://api.weatherapi.com/v1/forecast.json?key=$key&q=$q&days=7',
        ),
      );
      if (response.statusCode == 200) {
        List jsonData = jsonDecode(response.body) as List;
        return jsonData.map((e) => Forecastmodel.fromJson(e)).toList();
      }
    } catch (e) {
      final response = await http.get(
        Uri.parse(
          'http://api.weatherapi.com/v1/forecast.json?key=$key&q=$q&days=7',
        ),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        List data = jsonData['forecast']['forecastday'] as List;
        return data.map((e) => Forecastmodel.fromJson(e)).toList();
      }
    }
    return null;
  }
}
