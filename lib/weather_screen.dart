import 'package:broadway_example_ui/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService service = WeatherService();
  double temp = 0.0;
  int humidity = 0;
  double speed = 0.0;
  // String cityName = '';
  String city = "";
  final searchController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather App")),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Position position = await determinePosition();
          double latitude = position.latitude;
          double longitude = position.longitude;
          print("Latitude: ${position.latitude}");
          print("Longitude: ${position.longitude}");
          final data = await service.getCurrentLocationWeather(
            latitude,
            longitude,
          );
          print(data);
        },
        child: Icon(Icons.my_location),
      ),
      body: Column(
        children: [
          //TextFormField
          //controller: searchController
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Enter city Name"),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              String cityname = searchController.text;
              if (cityname.isNotEmpty) {
                final data = await service.getWeather(cityname);
                print(data);

                setState(() {
                  temp = data.main.temp;
                  humidity = data.main.humidity;
                  speed = data.wind.speed;
                  city = data.name;
                });
                print(temp);
              } else {
                print("Enter City Name");
              }

              // temp= data
            },
            child: Text("Get Weather"),
          ),
          Text("Your City is $city"),
          Text("Your Temperature is $temp"),
          Text("Your Humidity is $humidity"),
          Text("Your Speed is $speed"),
        ],
      ),
    );
  }
}
