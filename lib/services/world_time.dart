import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {
  String location; // location name for the UI
  String time=""; // time in that location
  String flag; // url to an asset flag icon
   bool isDaytime=false;
  String url; //location url for the api endpoint


   WorldTime({required this.location, required this.flag, required this.url});


 Future<void> getTime() async

  {
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    // print(data);

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(0, 3);

    //get properties from data
    //print(datetime);
    // print(offset);

    //get dataTime objet
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    isDaytime = now.hour >6 && now.hour <20 ? true : false;
    time = DateFormat.jm().format(now);
  }
}


