
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test_app/model/Weather.dart';


Future<void> main() async{

  Future<Weather> fetchAlbum() async {
    final response = await http.get('https://api.openweathermap.org/data/2.5/weather?q=Nur-sultan,KZ&APPID=fa9697ad487686562567e8bed5b2d8ae&lang=ru');

    return Weather.fromJson(json.decode(response.body));

  }


  Weather weather = await fetchAlbum();

  print([weather.coord_lon,weather.coord_lat,weather.weather_id,weather.weather_main,weather.weather_description]);

}
