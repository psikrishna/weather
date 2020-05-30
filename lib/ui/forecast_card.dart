import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/model/weather_forecast_model.dart';
import 'package:weather/util/convert_icon.dart';
import 'package:weather/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayOfWeek = "";
  var fullDate = Util.getFormatDate(
      new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000));
  dayOfWeek = fullDate.split(",")[0];
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      //Text(Util.getFormatDate(new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt*1000)).toString()),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 33.0,
            backgroundColor: Colors.white,
            child: getWeatherIcon(
                weatherDescription: forecastList[index].weather[0].main,
                color: Colors.pinkAccent,
                size: 45.0),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        "${forecastList[index].main.tempMin.toStringAsFixed(0)}°C"),
                  ),
                  Icon(
                    FontAwesomeIcons.arrowDown,
                    color: Colors.brown,
                    size: 14,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        "${forecastList[index].main.tempMax.toStringAsFixed(0)}°C"),
                  ),
                  Icon(
                    FontAwesomeIcons.arrowUp,
                    color: Colors.brown,
                    size: 14,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        "${forecastList[index].main.humidity.toStringAsFixed(0)}%"),
                  ),
                  Icon(
                    FontAwesomeIcons.grinBeamSweat,
                    color: Colors.brown,
                    size: 14,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        "${(forecastList[index].wind.speed * 3.6).toStringAsFixed(0)}km/h"),
                  ),
                  Icon(
                    FontAwesomeIcons.wind,
                    color: Colors.brown,
                    size: 14,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
