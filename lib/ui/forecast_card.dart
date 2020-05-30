import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/model/weather_forecast_model.dart';
import 'package:weather/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot,int index){
  var forecastList=snapshot.data.list;
  var dayOfWeek="";
  var fullDate=Util.getFormatDate(new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt*1000));
  dayOfWeek=fullDate.split(",")[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      //Text(Util.getFormatDate(new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt*1000)).toString()),
      Text(dayOfWeek),
      Text(index.toString()),
      //Text((Util.getFormatDate(new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt*1000))).toString().split(",")[0]),
      Text("${forecastList[index].dt.toString()}"),
    ],
  );
}