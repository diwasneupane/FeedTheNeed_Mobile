import 'package:feedtheneed/model/mapmodel.dart';
import 'package:feedtheneed/repositories/map_repository.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? myLocation;
  List<MapData?>? map;
  @override
  void initState() {
    getmapDetails();

    // debugPrint(getmapDetails().toString());
    super.initState();
  }

  void getmapDetails() async {
    List<MapData?> map1 = await MapRepository().getMapDetails();
    // debugPrint("bbbbb${map1[0]!.lat}");

    setState(() {
      map = map1;
      // debugPrint('add${map![0]!.lat}');
    });
    // debugPrint("bbbbb${map![0]!.long}");

    myLocation = map != null
        ? LatLng(
            double.parse("${map![0]!.lat}"), double.parse("${map![0]!.long}"))
        : const LatLng(27.7061, 85.3300);

    markers.add(
      Marker(
        markerId: MarkerId(myLocation.toString()),
        position: myLocation!,
        infoWindow: const InfoWindow(
          title: 'FeedTheNeed',
          snippet: 'Serving the Need',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
  }

  GoogleMapController? mapController;
  Set<Marker> markers = {};
  // LatLng myLocation1 = const LatLng(27.70622, 85.33064);
  @override
  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return map != null
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Meet us here",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 1,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: const [],
            ),
            body: Stack(
              children: [
                GoogleMap(
                  mapType: _currentMapType,
                  zoomGesturesEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: myLocation!,
                    zoom: 17,
                  ),
                  markers: markers,
                  // mapType: MapType.normal,
                  onMapCreated: (controller) {
                    setState(() {
                      mapController = controller;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    // add your floating action button
                    child: FloatingActionButton(
                      backgroundColor: const Color(0xFF41A2CD),
                      onPressed: _onMapTypeButtonPressed,
                      child: const Icon(Icons.map),
                    ),
                  ),
                ),
              ],
            ),
          )
        : const Scaffold();
  }
}
