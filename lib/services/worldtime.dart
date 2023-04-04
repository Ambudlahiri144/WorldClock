import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
class WorldTime{
  String location;
  String time="";
  String flag;
  String url;
  late bool isDaytime;
  WorldTime({required this.location,required this.flag,required this.url});
  Future<void> getTime() async {
    Response response = await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
    Map data = jsonDecode(response.body);
    String datetime = data['utc_datetime'];
    String offset = data['utc_offset'].substring(1,3);
    // print(datetime);
    // print(offset);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    isDaytime = now.hour > 6 && now.hour < 20? true:false;
    time = DateFormat.jm().format(now);

  }
}


