import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gb_shop/Models/Foto.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class FotoProvider extends ChangeNotifier{
  List<Foto> fotos = [];
  final String _host ='www.gbshopapi.somee.com';
  //final Map<String, dynamic> _parameters = {'key':'960d9f80'};
  FotoProvider(){
    fetchFoto();
  }

  fetchFoto() async {
    const String endPoint ='/api/Foto';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      notifyListeners();
      print(response);
      fotos =
         List<Foto>.from(json.decode(response).map((x) => Foto));
    } finally {
      client.close();
     }
  } 
}
