
  // @override
  // void initState() {

  //   super.initState();
  
  //   //checkLocationServicesInDevice();

  // }
  // Future<void> checkLocationServicesInDevice() async {

  //   Location location = new Location();

  //   _serviceEnabled = await location.serviceEnabled();

  //   if(_serviceEnabled)
  //   {
    
  //     _permissionGranted = await location.hasPermission();

  //     if(_permissionGranted == PermissionStatus.granted)
  //     {
        
  //       // _location = await location.getLocation();

  //       // print(_location.latitude.toString() + " " + _location.longitude.toString());

        
  //       location.onLocationChanged.listen((LocationData currentLocation) {
  //         print(currentLocation.latitude.toString() + " " + currentLocation.longitude.toString());
  //       });

  //     }else{

  //       _permissionGranted = await location.requestPermission();

  //       if(_permissionGranted == PermissionStatus.granted)
  //       {
          
  //         print('user allowed');

  //       }else{

  //         SystemNavigator.pop();

  //       }

  //     }
    
  //   }else{

  //     _serviceEnabled = await location.requestService();

  //     if(_serviceEnabled)
  //     {
        
  //       _permissionGranted = await location.hasPermission();

  //       if(_permissionGranted == PermissionStatus.granted)
  //       {
          
  //         print('user allowed before');

  //       }else{

  //         _permissionGranted = await location.requestPermission();

  //         if(_permissionGranted == PermissionStatus.granted)
  //         {
            
  //           print('user allowed');

  //         }else{

  //           SystemNavigator.pop();

  //         }

  //       }

      
  //     }else{

  //       SystemNavigator.pop();
      
  //     }

  //   }
    
  // }
