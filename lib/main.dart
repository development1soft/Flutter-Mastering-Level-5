import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:maps_pratical_flutter/tracking/realtime.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  void initState() {

    super.initState();
  
    storeUserLocation();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Pratice'),
      ),
      body: Center(
        child: FlatButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => RealtimeMapScrren()));
        }, child: Text('Realtime Tracking Map'),color: Colors.black,textColor: Colors.white,),
      ),
    );
  }


  storeUserLocation()
  {

    Location location = new Location();
    
    location.onLocationChanged.listen((LocationData currentLocation) {
      
      Firestore.instance.collection('users').document('nrC0LYmjHlGLPCE4SwcQ').setData({
        'name' : 'Eyad',
        'location' : GeoPoint(currentLocation.latitude, currentLocation.longitude)
        
      });
    
    });

  }
}
