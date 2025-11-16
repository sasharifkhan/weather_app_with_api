import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LocationService {
  
  static Future<Map<String, dynamic>> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled.");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // throw Exception("Location permission denied.");
        return {"place": "Unknown"};
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // throw Exception("Location permission permanently denied.");
      return {"place": "Unknown"};
    }

    final pos = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    );

    String placeName = "Unknown";

    try{
      var resposnse = await http.get(Uri.parse("https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${pos.latitude}&lon=${pos.longitude}&accept-language=en"),headers: {'User-Agent': 'Nectar/1.0'});
        if (resposnse.statusCode == 200 || resposnse.statusCode == 201) {
          var jsonlocationn = jsonDecode(resposnse.body);
          placeName = "${jsonlocationn['address']['road']}, ${jsonlocationn['address']['city']}";
        } else {
          placeName = "Unknown Location";
        }
    } catch (e) {
      placeName = "Unknown Location";
    }


    return {
      "latitude": pos.latitude,
      "longitude": pos.longitude,
      "place": placeName,
    };
  }
}