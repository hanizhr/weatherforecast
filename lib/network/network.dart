import 'dart:convert';

import 'package:http/http.dart';

import '../util/forecastutil.dart';
import '../weatherForecastModel.dart';

class Network {
  Future<weatherForecastModel> getWeatherForecast(String cityName) async {
    var finalURL = "https://api.openweathermap.org/data/2.5/forecast/daily?q="+cityName+"&appid="+Util.appId
        +"&units=imperial"; // change to metric

    final response = await get(Uri.parse(Uri.encodeFull(finalURL)));

    print("URL : ${Uri.parse(finalURL)}");
    if(response.statusCode == 200){
      print("weather data: ${response.body}");
      return weatherForecastModel.fromJson(json.decode(response.body)); //we get the actual map model(dart object)
    }else{
      throw Exception("error getting weather forecast");
    }
  }
}