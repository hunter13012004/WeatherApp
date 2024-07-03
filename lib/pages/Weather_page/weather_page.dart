import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class WeatherPage extends StatefulWidget {
  final Weather weather;
  final DateTime now;
  const WeatherPage({super.key, required this.weather, required this.now});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // @override
  // void initState() {
  //   DateTime now = widget.weather.date!;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go India Stock'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                widget.weather.areaName.toString(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                DateFormat('hh:mm a').format(widget.now),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('EEEE').format(widget.now),
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    ' ${DateFormat('dd.MM.yy').format(widget.now)}',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'http://openweathermap.org/img/wn/${widget.weather.weatherIcon.toString()}@4x.png'))),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.weather.weatherDescription.toString(),
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '${widget.weather.temperature!.celsius!.toStringAsFixed(0)} ℃',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Max : ${widget.weather.tempMax!.celsius!.toStringAsFixed(0)} ℃',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                              'Min : ${widget.weather.tempMin!.celsius!.toStringAsFixed(0)} ℃',
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Wind : ${widget.weather.windSpeed!.toStringAsFixed(0)} m/s',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                              'Humidity : ${widget.weather.humidity!.toStringAsFixed(0)} %',
                              style: TextStyle(fontSize: 20)),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
