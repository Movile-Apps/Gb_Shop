// To parse this JSON data, do
//
//     final geoubicacion = geoubicacionFromJson(jsonString);

import 'dart:convert';

import 'package:gb_shop/Models/Foto.dart';

Patrocinador geoubicacionFromJson(String str) => Patrocinador.fromJson(json.decode(str));

String geoubicacionToJson(Patrocinador data) => json.encode(data.toJson());

class Patrocinador {
    Patrocinador({
        this.idPadrocinador,
        this.idFoto,
        this.nombre,
        this.email,
        this.telefono,
        this.fotoRequest,
    });

    int? idPadrocinador;
    int? idFoto;
    String? nombre;
    String? email;
    String? telefono;
    Foto? fotoRequest;

    factory Patrocinador.fromJson(Map<String, dynamic> json) => Patrocinador(
        idPadrocinador: json["idPadrocinador"],
        idFoto: json["idFoto"],
        nombre: json["nombre"],
        email: json["email"],
        telefono: json["telefono"],
        fotoRequest: Foto.fromJson(json["fotoRequest"])
    );

    Map<String, dynamic> toJson() => {
        "idPadrocinador": idPadrocinador,
        "idFoto": idFoto,
        "nombre": nombre,
        "email": email,
        "telefono": telefono,
        "fotoRequest": fotoRequest?.toJson(),
    };
}
