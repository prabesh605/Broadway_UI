import 'package:broadway_example_ui/weather/weather_brain.dart';
import 'package:broadway_example_ui/weather/weather_model.dart';
import 'package:broadway_example_ui/weather/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService service = WeatherService();
  WeatherBrain weatherBrain = WeatherBrain();
  WeatherModel? weather;
  double temp = 0.0;
  int humidity = 0;
  double speed = 0.0;

  String city = "";
  String textIcon = "🌫️";
  String weatherText = "Search to get data";
  bool isLoading = false;

  Future<Position> determinePosition() async {
    bool serviceEnabled; //hamro loction is enable or not
    LocationPermission permission; // hamile permission diyeko xa ki xaina

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (!serviceEnabled) {
      return Future.error("Location is not enable");
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }
    return await Geolocator.getCurrentPosition();

    // location is on or off
    //user le permission diyeko xa ki xaina
  }

  Future<void> getCurrentData() async {
    isLoading = true;
    final Position position = await determinePosition();
    double latitude = position.latitude;
    double longitude = position.longitude;
    print("Latitude: ${position.latitude}");
    print("Longitude: ${position.longitude}");
    final data = await service.getCurrentLocationWeather(latitude, longitude);
    weather = data;
    print(data);

    temp = data.main.temp;
    humidity = data.main.humidity;
    speed = data.wind.speed;
    city = data.name;
    textIcon = weatherBrain.getWeatherIcon(data.cod);
    weatherText = weatherBrain.getWeatherText(data.cod);
    isLoading = false;
    notifyListeners();
  }

  Future<void> getSearchData(String cityname) async {
    isLoading = true;
    final data = await service.getWeather(cityname);
    weather = data;
    print(data);

    temp = data.main.temp;
    humidity = data.main.humidity;
    speed = data.wind.speed;
    city = data.name;
    textIcon = weatherBrain.getWeatherIcon(data.cod);
    weatherText = weatherBrain.getWeatherText(data.cod);
    isLoading = false;
    notifyListeners();
  }
}
