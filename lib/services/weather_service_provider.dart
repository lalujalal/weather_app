

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_response_model.dart';
import 'package:weather_app/secrets/api.dart';
import 'package:http/http.dart' as http;


class WeatherServiceProvider extends ChangeNotifier{ 

  WeatherModel?_weather;
  WeatherModel? get weather=>_weather;

  bool _isLoading=false;
  bool get isLoading=>_isLoading;

  String _error="";
  String get error=>_error;

  Future<void> fetchWeatherDataByCity(String city)async{
    _isLoading=true;
    _error="";

    try{

      final apiUrl="${APIendpoints().cityurl}${city}&appid=${APIendpoints().apikey}${APIendpoints().unit}";
      print(apiUrl);
      final response= await http.get(Uri.parse(apiUrl));

      if(response.statusCode==200){
        final data=jsonDecode(response.body);
        print(data);

        _weather=WeatherModel.fromJson(data);
        print(_weather!.name);
        notifyListeners();
      }else{
        _error="failed to load data";
      }
    }catch(e){
      _error="failed to load data$e";
    }finally{
      _isLoading=false;
      notifyListeners();
    }
  }
}