import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static Marker googlemaps = const Marker(
      infoWindow: InfoWindow(title: 'google maps'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(19.0091366, 73.1039735),
      markerId: MarkerId('googlemaps'));
  static Marker googlemarker2 = Marker(
      infoWindow: const InfoWindow(title: 'google marker'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(19.0091366, 73.1139735),
      markerId: const MarkerId('googlemar'));
  static Polyline polymaps = const Polyline(
      polylineId: PolylineId('polymaps'),
      color: Color.fromARGB(255, 18, 213, 0),
      width: 1,
      points: [LatLng(19.0091366, 73.1039735), LatLng(19.0091366, 73.1139735)]);
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  final LatLng _center = const LatLng(19.0091366, 73.1039735);

  late GoogleMapController mapController;
  late GoogleMapController _googleMapController;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 48, 48, 48),
                title: const Text('Sasta Google Maps')),
            body: GoogleMap(
              markers: {googlemaps, googlemarker2},
              polylines: {polymaps},
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 13,
              ),
              // markers: Set<Marker>.of(markers.values),
              // polylines: Set<Polyline>.of(polylines.values),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 48, 48, 48),
              child: const Icon(Icons.center_focus_strong),
              onPressed: () async {
                mapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: _center,
                      zoom: 18.0,
                    ),
                  ),
                );
              },
            )));
  }
}
