import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gb_shop/Models/patrocinador.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class PatrocinadorProvider extends ChangeNotifier{
  List<Patrocinador> eventos = [];
  final String _host ='www.gbshopapi.somee.com';
  //final Map<String, dynamic> _parameters = {'key':''};
  PatrocinadorProvider(){
    fetchPatrocinador();
  }
//http://www.gbshopapi.somee.com/api/EventoLimpieza
  fetchPatrocinador() async {
    const String endPoint ='/api/Patrocinador';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      notifyListeners();
      print(response);
      eventos =
         List<Patrocinador>.from(json.decode(response).map((x) => Patrocinador));
    } finally {
      client.close();
     }
  } 
}