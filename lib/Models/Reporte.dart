// To parse this JSON data, do
//
//     final evento = eventoFromJson(jsonString);

import 'dart:convert';

import 'package:gb_shop/Models/Etiqueta.dart';
import 'package:gb_shop/Models/Foto.dart';
import 'package:gb_shop/Models/Geoubicacion.dart';
import 'package:gb_shop/Models/Usuario.dart';

Reporte eventoFromJson(String str) => Reporte.fromJson(json.decode(str));

String eventoToJson(Reporte data) => json.encode(data.toJson());

class Reporte {
    Reporte({
        this.idReporte,
        this.idUsuario,
        this.idEtiqueta,
        this.idFoto,
        this.idGeoubicacion,
        this.fecha,
        this.descripcion,
        this.usuarioRequest,
        this.etiquetaRequest,
        this.fotoRequest,
        this.geoubicacionRequest,
    });

    int? idReporte;
    int? idUsuario;
    int? idEtiqueta;
    int? idFoto;
    int? idGeoubicacion;
    DateTime? fecha;
    String? descripcion;
    Usuario? usuarioRequest;
    Etiqueta? etiquetaRequest;
    Foto? fotoRequest;
    Geoubicacion? geoubicacionRequest;

    factory Reporte.fromJson(Map<String, dynamic> json) => Reporte(
        idReporte: json["idReporte"],
        idUsuario: json["idUsuario"],
        idEtiqueta: json["idEtiqueta"],
        idFoto: json["idFoto"],
        idGeoubicacion: json["idGeoubicacion"],
        fecha: DateTime.parse(json["fecha"]),
        descripcion: json["descripcion"],
        usuarioRequest: Usuario.fromJson(json["usuarioRequest"]),
        etiquetaRequest: Etiqueta.fromJson(json["etiquetaRequest"]),
        fotoRequest: Foto.fromJson(json["fotoRequest"]),
        geoubicacionRequest: Geoubicacion.fromJson(json["geoubicacionRequest"]),
    );

    Map<String, dynamic> toJson() => {
        "idReporte": idReporte,
        "idUsuario": idUsuario,
        "idEtiqueta": idEtiqueta,
        "idFoto": idFoto,
        "idGeoubicacion": idGeoubicacion,
        "fecha": fecha?.toIso8601String(),
        "descripcion": descripcion,
        "usuarioRequest": usuarioRequest?.toJson(),
        "etiquetaRequest": etiquetaRequest?.toJson(),
        "fotoRequest": fotoRequest?.toJson(),
        "geoubicacionRequest": geoubicacionRequest?.toJson(),
    };
}