import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<StatefulWidget> createState() => MapsPage();
}

class MapsPage extends State<MapsScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(41.15, -8.61024),
    zoom: 11.5,
  );

  late Location _location;

  @override
  void initState() {
    super.initState();
    _location = Location();
    _location.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: const GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
