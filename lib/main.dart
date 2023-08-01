import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'dart:async';
import 'module.dart' as coreModule;

String display = "Fetching weather data...";

void main() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelKey: 'rainapp_alert',
          channelName: 'RainAPPAlert',
          channelDescription: 'Alerts for RainAPP'),
    ],
  );
  runApp(MaterialApp(home: MyApp()));
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> initRun() async {
    bool res = await coreModule.fetchWeatherData();
    if (res) {
      setState(() {
        display = "It's likely to rain in the next hour";
      });
    } else {
      setState(() {
        display = "No rain expected in the next hour";
      });
    }
  }

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initRun();
    Timer.periodic(const Duration(minutes: 40), (timer) {
      initRun();
    });

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: const Color(0xff000000),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.zero,
          border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Image(
              image: NetworkImage("https://iili.io/HQDbMP4.png"),
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 150,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  //add text handler
                  display,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: 15,
              child: Align(
                alignment: Alignment(0.0, 1.0),
                child: Text(
                  "RainAPP Beta",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 22,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
            // attribute with text "Weather data by Open-Meteo.com"
            const Positioned(
              bottom: 0,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Weather data by Open-Meteo.com",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
