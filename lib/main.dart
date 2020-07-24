import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
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
  
  bool _serviceEnabled;

  PermissionStatus _permissionGranted;

  LocationData _location;

  @override
  void initState() {

    super.initState();
  
    checkLocationServicesInDevice();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Pratice'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkLocationServicesInDevice() async {

    Location location = new Location();

    _serviceEnabled = await location.serviceEnabled();

    if(_serviceEnabled)
    {
    
      _permissionGranted = await location.hasPermission();

      if(_permissionGranted == PermissionStatus.granted)
      {
        
        _location = await location.getLocation();

        print(_location.latitude.toString() + " " + _location.longitude.toString());

      }else{

        _permissionGranted = await location.requestPermission();

        if(_permissionGranted == PermissionStatus.granted)
        {
          
          print('user allowed');

        }else{

          SystemNavigator.pop();

        }

      }
    
    }else{

      _serviceEnabled = await location.requestService();

      if(_serviceEnabled)
      {
        
        _permissionGranted = await location.hasPermission();

        if(_permissionGranted == PermissionStatus.granted)
        {
          
          print('user allowed before');

        }else{

          _permissionGranted = await location.requestPermission();

          if(_permissionGranted == PermissionStatus.granted)
          {
            
            print('user allowed');

          }else{

            SystemNavigator.pop();

          }

        }

      
      }else{

        SystemNavigator.pop();
      
      }

    }
    
  }

}
