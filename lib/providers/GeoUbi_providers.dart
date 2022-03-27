import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gb_shop/Models/GeoUbi.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class GeoUbicacionProvider extends ChangeNotifier{
  List<GeoUbicacion> geoUbicaciones = [];
  final String _host ='www.gbshopapi.somee.com';
  GeoUbicacionProvider(){
    fetchtGeoUbicacion();
  }

  fetchtGeoUbicacion() async {
    const String endPoint ='/api/GeoUbicacion';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      notifyListeners();
      print(response);
      geoUbicaciones =
         List<GeoUbicacion>.from(json.decode(response).map((x) => GeoUbicacion()));
    } finally {
      client.close();
     }
  } 
}