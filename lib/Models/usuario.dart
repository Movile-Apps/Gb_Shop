// To parse this JSON data, do
//
//     final geoubicacion = geoubicacionFromJson(jsonString);

import 'dart:convert';

import 'package:gb_shop/Models/Foto.dart';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
        this.idUsuario,
        this.idFoto,
        this.nombre,
        this.apellido,
        this.correo,
        this.contrasea,
        this.fotoRequest,
    });

    int? idUsuario;
    int? idFoto;
    String? nombre;
    String? apellido;
    String? correo;
    String? contrasea;
    Foto? fotoRequest;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        idUsuario: json["idUsuario"],
        idFoto: json["idFoto"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        correo: json["correo"],
        contrasea: json["contraseña"],
        //fotoRequest: Foto.fromJson(json["fotoRequest"]),
    );

    Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
        "idFoto": idFoto,
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
        "contraseña": contrasea,
        "fotoRequest": fotoRequest?.toJson(),
    };
}
