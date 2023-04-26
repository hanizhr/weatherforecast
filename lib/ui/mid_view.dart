import 'package:flutter/material.dart';
import 'package:weatherforecast/util/convert_icon.dart';

import '../util/forecastutil.dart';
import '../weatherForecastModel.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget midView(AsyncSnapshot<weatherForecastModel> snapshot) {
  var forecastList = snapshot.data!.list;
  var city = snapshot.data?.city?.name;
  var country = snapshot.data?.city?.country;
  var formattedData = Util.getFormattedData(new DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt as int));
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("${city}, ${country}", style:
        TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black,
        ),),
          Text("$formattedData", style: TextStyle(fontSize: 15)),
          SizedBox(height: 10,),
          getWeatherIcon(forecastList[0].weather![0].main as String, Colors.white , 200),
          //Icon(FontAwesomeIcons.cloud, size: 200, color: Colors.blueGrey),
          //Icon(Icons.sunny_snowing,size: 195,color: Colors.blueGrey,),

          Padding(
            padding: const EdgeInsets.symmetric(vertical:12,horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text("${forecastList[0].temp?.day?.toStringAsFixed(0)}°F",
                style: TextStyle(fontSize:35),),
                Text("  ${forecastList![0].weather![0].description?.toUpperCase()}"),

              ]
            ),

          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical:12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          //Icon(Icons.speed, size: 20, color: Colors.blueGrey),
                          Icon(FontAwesomeIcons.wind, size: 20,color: Colors.blueGrey[900]),
                          Text("${forecastList![0].speed?.toStringAsFixed(1)} mi/h"),
                        ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Icon(FontAwesomeIcons.water, size: 20, color: Colors.blueGrey[900]),
                          //Icon(Icons.hub, size: 20, color: Colors.blueGrey),
                          Text("${forecastList![0].humidity?.toStringAsFixed(1)} %"),
                        ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Icon(FontAwesomeIcons.temperatureHigh, size: 20, color: Colors.blueGrey[900]),
                          //Icon(Icons.rotate_90_degrees_cw, size: 20, color: Colors.blueGrey),
                          Text("${forecastList![0].temp?.max?.toStringAsFixed(1)} °F"),
                        ]
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
  return midView;
}
