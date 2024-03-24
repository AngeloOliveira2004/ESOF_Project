import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Importe o pacote google_maps_flutter


class MapsScreen extends StatefulWidget{
  
  
  @override
  State<StatefulWidget> createState() => MapsPage();
  
}

class MapsPage extends State<MapsScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(41.15, -8.61024),
    zoom: 11.5,
    );
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
      ),
    );
  }
}

