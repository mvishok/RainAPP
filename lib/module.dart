import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:awesome_notifications/awesome_notifications.dart';

Future<Map<String, dynamic>> getHourlyForecast(
    double latitude, double longitude) async {
  String baseUrl = "https://api.open-meteo.com/v1/forecast";
  Map<String, String> params = {
    "latitude": latitude.toString(),
    "longitude": longitude.toString(),
    "hourly": "temperature_2m,precipitation_probability"
  };

  try {
    Uri uri = Uri.parse(baseUrl).replace(queryParameters: params);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> forecastData = json.decode(response.body);
      return forecastData;
    } else {
      throw Exception("Failed to fetch weather data");
    }
  } catch (e) {
    return {};
  }
}

bool checkRainInNextHour(Map<String, dynamic> forecastData) {
  // ignore: unnecessary_null_comparison
  if (forecastData == null) {
    return false;
  }

  // Check if "hourly" key exists and it is a non-empty map.
  if (forecastData.containsKey("hourly") &&
      forecastData["hourly"] is Map &&
      forecastData["hourly"].containsKey("time") &&
      forecastData["hourly"].containsKey("precipitation_probability")) {
    List<String> timeList = List<String>.from(forecastData["hourly"]["time"]);
    List<int> precipitationProbabilityList =
        List<int>.from(forecastData["hourly"]["precipitation_probability"]);

    // Find the index of the next hour in the "time" list.
    DateTime currentTime = DateTime.now();
    int nextHourIndex = -1;

    for (int i = 0; i < timeList.length; i++) {
      DateTime forecastTime = DateTime.parse(timeList[i]);
      if (forecastTime.isAfter(currentTime)) {
        nextHourIndex = i;
        break;
      }
    }

    // If next hour's index found and probability data available, check precipitation.
    if (nextHourIndex != -1 &&
        nextHourIndex < precipitationProbabilityList.length) {
      int precipitationProbability =
          precipitationProbabilityList[nextHourIndex];
      if (precipitationProbability > 50) {
        return true;
      }
    }
  }

  return false;
}

Future<bool> fetchWeatherData() async {
  bool servicestatus = await Geolocator.isLocationServiceEnabled();
  if (!servicestatus) {
    notify("Please enable location services to get weather updates");
    return false;
  }
  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      notify("Please grant location permissions to get rain alerts");
    } else if (permission == LocationPermission.deniedForever) {
      notify(
          "Location permissions are permanently denied, we cannot request permissions");
    }
  }

  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  double latitude = position.latitude;
  double longitude = position.longitude;

  Map<String, dynamic> forecastData =
      await getHourlyForecast(latitude, longitude);

  bool result = checkRainInNextHour(forecastData);
  if (result) {
    notify("It's likely to rain in the next hour 🌧️☔");
    return true;
  } else {
    return false;
  }
}

notify(String message) {
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 10,
      channelKey: 'rainapp_alert',
      title: 'RainAPP Alert',
      body: message,
    ),
  );
}
