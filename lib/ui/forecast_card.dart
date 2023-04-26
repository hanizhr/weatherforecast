import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherforecast/util/convert_icon.dart';
import 'package:weatherforecast/weatherForecastModel.dart';
import '../util/forecastutil.dart';

Widget forecastCard(AsyncSnapshot<weatherForecastModel>snapshot, int index){
  var forecastList = snapshot.data?.list;
  var dayOfWeek = "";
  var fullDate = Util.getFormattedData(DateTime.fromMillisecondsSinceEpoch(
      (forecastList![index].dt as int) * 10000)
  );
  dayOfWeek = fullDate.split(",")[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Text(dayOfWeek),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          CircleAvatar(
            radius: 33,
            backgroundColor : Colors.transparent,
            child: getWeatherIcon(forecastList[0].weather![0].main as String, Colors.white, 35),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text("${forecastList![index].temp?.min?.toStringAsFixed(0)} °F"),
                  ),
                  Icon(FontAwesomeIcons.solidArrowAltCircleDown, color: Colors.white, size:17),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text("${forecastList![index].temp?.max?.toStringAsFixed(0)} °F"),
                  ),
                  Icon(FontAwesomeIcons.solidArrowAltCircleUp, color: Colors.white, size:17),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text("hum: ${forecastList![index].humidity?.toStringAsFixed(0)} %"),
                  ),
                  //Icon(FontAwesomeIcons.water, color: Colors.white, size:17),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text("win: ${forecastList![index].speed?.toStringAsFixed(1)} mi/h"),
                  ),
                 // Icon(FontAwesomeIcons.wind, color: Colors.white, size:17),
                ],
              ),
            ],
          ),
        ],
      ),

    ],
  );
}