import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RealtimeMapScrren extends StatefulWidget{
  @override
  _RealtimeMapScrrenState createState() => _RealtimeMapScrrenState();
}

class _RealtimeMapScrrenState extends State<RealtimeMapScrren> {

  Completer<GoogleMapController> _controller = Completer();
  
  List<Marker> markers = [];

  @override
  void initState() {
    
    super.initState();

    Firestore.instance.collection('users').snapshots().listen((event){

      event.documentChanges.forEach((change){

        setState(() {
          
          markers.add(

            Marker(
              markerId: MarkerId(change.document.documentID),
              infoWindow: InfoWindow(
                title: change.document.data['name'].toString()
              ),
              position: LatLng(change.document.data['location'].latitude,change.document.data['location'].longitude)
            )

          );

        });

      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realtime Map'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(38.9637, 35.2433),
          zoom: 10,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers:markers.toSet(),
      ),
    );
  }
}