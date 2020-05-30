import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/model/weather_forecast_model.dart';
import 'package:weather/ui/forecast_card.dart';
import 'package:weather/util/hex_color.dart';

Widget bottomView(AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context){
  var forecastList=snapshot.data.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text("7-Day Weather Forecast".toUpperCase(),style: TextStyle(color: Colors.black87,fontSize: 14.0),),
      Container(
        height: 170,
        padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 10.0),
        child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: 8.0,),
            itemCount: forecastList.length,
            itemBuilder: (context,index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Container(
                width: MediaQuery.of(context).size.width/2.7,
                height: 160,
                child: forecastCard(snapshot,index),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [HexColor("#9661C3"),Colors.white],
                  begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
        ),
      )
    ],
  );
}