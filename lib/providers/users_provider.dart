import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gb_shop/Models/usuario.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class UsersProvider extends ChangeNotifier{
  List<Usuario> usuarios = [];
  final String _host ='www.gbshopapi.somee.com';
  //final Map<String, dynamic> _parameters = {'key':'1f68e690'};
  UsersProvider(){
    fetchUsuarios();
  }

  fetchUsuarios() async {
    const String endPoint ='/api/Usuario';
    final url = Uri.http(_host, endPoint);
    final client = RetryClient(http.Client());

    try {
      final response = await client.read(url);
      notifyListeners();
      print(response);
      usuarios =
         List<Usuario>.from(jsonDecode(response).map((x) => Usuario));
    } finally {
      client.close();
     }
  } 
}
