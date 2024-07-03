// weather_model.dart
class WeatherModel {
  final String cityName;
  final String weatherDescription;
  final double temperature;
  final double maxTemp;
  final double minTemp;
  final double windSpeed;
  final int humidity;
  final String time;
  final String date;

  WeatherModel({
    required this.cityName,
    required this.weatherDescription,
    required this.temperature,
    required this.maxTemp,
    required this.minTemp,
    required this.windSpeed,
    required this.humidity,
    required this.time,
    required this.date,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      weatherDescription: json['weather'][0]['description'],
      temperature: json['main']['temp'] - 273.15,
      maxTemp: json['main']['temp_max'] - 273.15,
      minTemp: json['main']['temp_min'] - 273.15,
      windSpeed: json['wind']['speed'],
      humidity: json['main']['humidity'],
      time: DateTime.now().toLocal().toString().split(' ')[1].substring(0, 5),
      date: DateTime.now().toLocal().toString().split(' ')[0],
    );
  }
}
