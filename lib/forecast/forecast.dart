import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/model/weather_forecast_model.dart';
import 'package:weather/network/network.dart';
import 'package:weather/ui/bottom_view.dart';
import 'package:weather/ui/mid_view.dart';
import 'package:weather/util/hex_color.dart';

class weatherForecast extends StatefulWidget {
  @override
  _weatherForecastState createState() => _weatherForecastState();
}

class _weatherForecastState extends State<weatherForecast> {
  Future<WeatherForecastModel> forecastObject;
  String _cityName = "Lucknow";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getWeather(cityName: _cityName);
//    forecastObject.then((weather) => {
//      print(weather.city.name)
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: HexColor("#4266A4"),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [HexColor("#4266A4"), HexColor("#CEADA7")],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 8.0,
                ),
                textFieldView(),
                Container(
                  child: FutureBuilder<WeatherForecastModel>(
                      future: forecastObject,
                      builder: (BuildContext context,
                          AsyncSnapshot<WeatherForecastModel> snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: <Widget>[
                              midView(snapshot),
                              bottomView(snapshot, context),
                            ],
                          );
                        } else {
                          return Center(
                            child: Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          );
                        }
                      }),
                )
              ],
            ),
          ),
//          textFieldView(),
//          Container(
//            child: FutureBuilder<WeatherForecastModel>(
//                future: forecastObject,
//                builder: (BuildContext context,
//                    AsyncSnapshot<WeatherForecastModel> snapshot) {
//                  if (snapshot.hasData) {
//                    return Column(
//                      children: <Widget>[
//                        midView(snapshot),
//                        bottomView(snapshot, context),
//                      ],
//                    );
//                  } else {
//                    return Center(
//                      child: Container(
//                        child: Center(
//                          child: CircularProgressIndicator(),
//                        ),
//                      ),
//                    );
//                  }
//                }),
//          )
        ],
      ),
    );
  }

  //search bar
  textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter City Name",
            hintStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
              size: 30.0,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            contentPadding: EdgeInsets.all(8.0),
          ),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              forecastObject = getWeather(cityName: _cityName);
            });
          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({String cityName}) =>
      new Network().getWeatherForecast(cityName: _cityName);
}
