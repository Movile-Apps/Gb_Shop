// To parse this JSON data, do
//
//     final etiqueta = etiquetaFromJson(jsonString);

import 'dart:convert';

import 'package:gb_shop/Models/Foto.dart';

Etiqueta etiquetaFromJson(String str) => Etiqueta.fromJson(json.decode(str));

String etiquetaToJson(Etiqueta data) => json.encode(data.toJson());

class Etiqueta {
    Etiqueta({
        this.idEtiqueta,
        this.idFoto,
        this.nombre,
        this.descripcion,
        this.fotoRequest,
    });

    int? idEtiqueta;
    int? idFoto;
    String? nombre;
    String? descripcion;
    Foto? fotoRequest;

    factory Etiqueta.fromJson(Map<String, dynamic> json) => Etiqueta(
        idEtiqueta: json["idEtiqueta"],
        idFoto: json["idFoto"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        fotoRequest: Foto.fromJson(json["fotoRequest"]),
    );

    Map<String, dynamic> toJson() => {
        "idEtiqueta": idEtiqueta,
        "idFoto": idFoto,
        "nombre": nombre,
        "descripcion": descripcion,
        "fotoRequest": fotoRequest?.toJson(),
    };
}
