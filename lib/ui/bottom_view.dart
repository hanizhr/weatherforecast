import 'package:flutter/material.dart';
import 'package:weatherforecast/ui/forecast_card.dart';
import 'package:weatherforecast/weatherForecastModel.dart';

Widget bottomView(
    AsyncSnapshot<weatherForecastModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data?.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        "7 day weather forecast".toUpperCase(),
        style: TextStyle(color: Colors.black87, fontSize: 15),
      ),
      Container(
        height: 190,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 16),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            separatorBuilder: (context,index) => SizedBox(width: 8,),
            itemCount: forecastList!.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.3,
                height: 160,
                child: forecastCard(snapshot, index),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors:[Color(0xffbae6e2), Colors.white60],
                  begin: Alignment.topLeft,
                  end:Alignment.bottomRight,
                  ),
                ),
              ),
          ),
        ),
        
      ),
    ],
  );
}
