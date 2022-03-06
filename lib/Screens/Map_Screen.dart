import 'dart:ffi';
/*Logre agregar el maps 06/03/2020. RF.*/
import 'package:flutter/material.dart';
import 'package:gb_shop/Screens/screens.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

 @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;

  @override
    void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
    Widget build(BuildContext context) {
      return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
            },
          ),
        ],
          title: const Text('Mapa'),
          leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            const CameraPosition cameraPosition = CameraPosition(
              target: LatLng(20.937139505752537, -89.62288462184497),
              zoom: 20.0,
            );
            _controller?.animateCamera(
              CameraUpdate.newCameraPosition(cameraPosition),
            );
          },
        ),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          _controller = controller;
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(20.9386694947874, -89.61653731751592),
          zoom: 15.0,
        ),
      ),
    );
  }
}