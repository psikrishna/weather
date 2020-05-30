import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/model/weather_forecast_model.dart';
import 'package:weather/util/convert_icon.dart';
import 'package:weather/util/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data.list;
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "${snapshot.data.city.name}, ${snapshot.data.city.country}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
          //Text("${snapshot.data.city.country}"),
          //created a var earlier forecastList to reduce length etc, and using the intl package to convert date-time
          Text(
            "${Util.getFormatDate(new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000))}",
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
          SizedBox(height: 10.0),
          getWeatherIcon(
              weatherDescription: forecastList[0].weather[0].main,
              color: Colors.pinkAccent,
              size: 145),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${forecastList[0].main.temp.toStringAsFixed(0)}°C",
                  style: TextStyle(
                    fontSize: 34.0,
                  ),
                ),
                Text("${forecastList[0].weather[0].description.toUpperCase()}"),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          "${forecastList[0].wind.speed.toStringAsFixed(1)}m/s"),
                      Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Colors.brown,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          "${forecastList[0].main.humidity.toStringAsFixed(0)}%"),
                      Icon(
                        Icons.hot_tub,
                        size: 20.0,
                        color: Colors.brown,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          "${forecastList[0].main.tempMax.toStringAsFixed(0)}°C"),
                      Icon(
                        Icons.wb_sunny,
                        size: 20.0,
                        color: Colors.brown,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
  return midView;
}
