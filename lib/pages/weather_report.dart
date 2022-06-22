import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Album {
  int? temp;
  int? feels_like;

  Album({
    this.temp,
    this.feels_like,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      temp: json['temp'],
      feels_like: json['feels_like'],
    );
  }
}

Future<Album> fetchAlbum() async {
  final response = await http.get(
      Uri.parse('https://weather-by-api-ninjas.p.rapidapi.com/v1/weather?city=Mumbai&country=India'),
      headers: {
        'X-RapidAPI-Key': '70e7a8fdc2mshc9e58cefa458646p1e71cbjsncd31fb2c143a',
        'X-RapidAPI-Host': 'weather-by-api-ninjas.p.rapidapi.com',
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class WeatherReport extends StatefulWidget {
  const WeatherReport({Key? key}) : super(key: key);

  @override
  _WeatherReportState createState() => _WeatherReportState();
}

class _WeatherReportState extends State<WeatherReport> {
  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Report"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text("${snapshot.data!.feels_like}");
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
