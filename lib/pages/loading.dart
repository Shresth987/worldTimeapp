
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {



void SetupWorldTime() async{
  WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
  await instance.getTime();
  print(instance.time);
Navigator.pushReplacementNamed(context, '/home',arguments: {
  'location': instance.location,
  'flag': instance.flag,
  'time': instance.time,
  'isDytime':instance.isDaytime,
});
}


  @override
  void initState(){
    super.initState();
    SetupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body:Center(
    child: SpinKitWanderingCubes(
      color: Colors.white,
      size: 50.0,
    ),
    ),
      );




  }
}


