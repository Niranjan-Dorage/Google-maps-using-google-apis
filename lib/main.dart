import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

double sourcelat = 0.0;
double sourcelng = 0.0;
double destlat = 0.0;
double destlng = 0.0;

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // void _addPolyline() {
  //   setState(() {
  //     // Locationservices.getPlaceID('Mumbai');
  //     // _polylines.add(Polyline(
  //     //   polylineId: PolylineId('polymaps'),
  //     //   color: Colors.green,
  //     //   width: 2,
  //     //   points: [source, destination],
  //     // ));
  //   });
  // }

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
    Marker googlemaps = Marker(
        infoWindow: const InfoWindow(title: 'google maps'),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(sourcelat, sourcelng),
        markerId: const MarkerId('googlemaps'));
    Marker googlemarker2 = Marker(
        infoWindow: const InfoWindow(title: 'google marker'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: LatLng(destlat, destlng),
        markerId: const MarkerId('googlemar'));
    final LatLng source = LatLng(sourcelat, sourcelng);
    final LatLng destination = LatLng(destlat, destlng);
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 197, 197, 197),
              appBar: AppBar(
                  backgroundColor: const Color.fromARGB(255, 48, 48, 48),
                  title: const Text('Sasta Google Maps')),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: size.width / 4,
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            "source :",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 45,
                          width: size.width / 4,
                          padding: EdgeInsets.only(left: size.width / 15),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 231, 230, 230),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              if (value != "") {
                                sourcelat = double.tryParse(value) as double;
                              } else if (value == "") {
                                sourcelat = 0.0;
                              }
                              print(sourcelat);
                            },
                            cursorColor: const Color.fromARGB(55, 97, 97, 97),
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                              fontFamily: "roboto",
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'roboto',
                              ),
                              hintText: 'Lat',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 45,
                          width: size.width / 4,
                          padding: EdgeInsets.only(left: size.width / 15),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 231, 230, 230),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              if (value != "") {
                                sourcelng = double.tryParse(value) as double;
                              } else if (value == "") {
                                sourcelng = 0.0;
                              }
                              print(sourcelng);
                            },
                            cursorColor: const Color.fromARGB(55, 97, 97, 97),
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                              fontFamily: "roboto",
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'roboto',
                              ),
                              hintText: 'Lng',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: size.width / 4,
                          margin: const EdgeInsets.all(10),
                          child: const Text(
                            "Dest : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 45,
                          width: size.width / 4,
                          padding: EdgeInsets.only(left: size.width / 15),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 231, 230, 230),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              if (value != "") {
                                destlat = double.tryParse(value) as double;
                              } else if (value == "") {
                                destlat = 0.0;
                              }
                              print(destlat);
                            },
                            cursorColor: const Color.fromARGB(55, 97, 97, 97),
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                              fontFamily: "roboto",
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'roboto',
                              ),
                              hintText: 'Lat',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          height: 45,
                          width: size.width / 4,
                          padding: EdgeInsets.only(left: size.width / 15),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 231, 230, 230),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              if (value != "") {
                                destlng = double.tryParse(value) as double;
                              } else if (value == "") {
                                destlng = 0.0;
                              }
                              print(destlng);
                            },
                            cursorColor: const Color.fromARGB(55, 97, 97, 97),
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                              fontFamily: "roboto",
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'roboto',
                              ),
                              hintText: 'Lng',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: GoogleMap(
                        markers: {googlemaps, googlemarker2},
                        polylines: {
                          Polyline(
                              polylineId: const PolylineId('route1'),
                              color: const Color.fromARGB(255, 15, 224, 43),
                              width: 2,
                              points: [source, destination])
                        },
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
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {});
                              mapController.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: source,
                                    zoom: 18.0,
                                  ),
                                ),
                              );
                            },
                            child: SizedBox(
                                width: 60,
                                child: const Text(
                                  'route',
                                  textAlign: TextAlign.center,
                                ))))
                  ],
                ),
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
              )),
        ));
  }
}
