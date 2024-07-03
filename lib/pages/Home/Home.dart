import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:goindiastock/pages/Weather_page/weather_page.dart';
import 'package:weather/weather.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController Locationcontroller = TextEditingController();

  WeatherFactory wf = WeatherFactory('652cb243ec2675c7770040cf00c801f5');

  Weather? weather;
  DateTime? now;
  // @override
  // void initState() {
  //   wf.currentWeatherByCityName(Locationcontroller.text.trim()).then((w) {
  //     weather = w;
  //     now = weather!.date!;
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Go India Stock',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Weather App',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            TextField(
              onSubmitted: (value) {
                setState(() {
                  value = Locationcontroller.text.trim();
                });
              },
              controller: Locationcontroller,
              decoration: InputDecoration(
                hintText: 'Search for location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                color: Colors.white12,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextButton(
                onPressed: () async {
                  String location = Locationcontroller.text.trim();
                  if (location.isNotEmpty) {
                    Weather? w = await wf.currentWeatherByCityName(location);
                    if (w != null) {
                      setState(() {
                        weather = w;
                        now = weather!.date!;
                      });
                      Get.to(() => WeatherPage(
                            now: now!,
                            weather: weather!,
                          ));
                    } else {
                      // Show error message if weather data is not available
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Weather data not available for $location'),
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  'Search',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
