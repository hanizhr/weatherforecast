import 'package:flutter/material.dart';
import 'package:weatherforecast/ui/bottom_view.dart';

//import '../parsing_json/json_parsing_map.dart';
import 'network/network.dart';
import 'ui/mid_view.dart';
import 'weatherForecastModel.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<weatherForecastModel> forecastObject;
  String _cityName = "Tehran";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getweather(_cityName);
    // forecastObject.then((weather) => {
    //   print(weather.list![0].weather![0].main),
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbae6e2),
      body: ListView(children: [
        textFieldView(), //textFieldView(),
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Container(
            child: FutureBuilder<weatherForecastModel>(
                future: forecastObject,
                builder: (BuildContext context,
                    AsyncSnapshot<weatherForecastModel> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        midView(snapshot),
                        bottomView(snapshot,context),
                      ],
                    );
                  } else {
                    return Container(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                }),
          ),
        )
      ]),
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter City Name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(8),
          ),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              forecastObject = getweather(_cityName);
            });
          },
        ),
      ),
    );
  }

  Future<weatherForecastModel> getweather(String cityName) =>
      new Network().getWeatherForecast(_cityName);
}
