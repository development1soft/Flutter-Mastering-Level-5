// Completer<GoogleMapController> _controller = Completer();

//   List<Marker> markers = [
//     Marker(
//       markerId: MarkerId('first place'),
//       infoWindow: InfoWindow(
//         title: 'this place is so nice'
//       ),
//       position: LatLng(41.0175302,29.1413539)
//     ),
//     Marker(
//       markerId: MarkerId('place 2'),
//       infoWindow: InfoWindow(
//         title: 'this place is so nice'
//       ),
//       position: LatLng(41.0154117,29.1190112)
//     ),
//     Marker(
//       markerId: MarkerId('place 3'),
//       infoWindow: InfoWindow(
//         title: 'this place is so nice'
//       ),
//       position: LatLng(41.0240567,29.0840848)
//     ),
//   ];

// GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition: CameraPosition(
//           target: LatLng(38.9637, 35.2433),
//           zoom: 0,
//         ),
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//         markers:markers.toSet(),
//       ),
//     )