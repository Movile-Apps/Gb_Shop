// To parse this JSON data, do
//
//     final evento = eventoFromJson(jsonString);

import 'dart:convert';

import 'package:gb_shop/Models/Foto.dart';
import 'package:gb_shop/Models/Geoubicacion.dart';
import 'package:gb_shop/Models/Patrocinador.dart';

Evento eventoFromJson(String str) => Evento.fromJson(json.decode(str));

String eventoToJson(Evento data) => json.encode(data.toJson());

class Evento {
    Evento({
        this.idEvento,
        this.idPatrocinador,
        this.idFoto,
        this.idGeoubicacion,
        this.fecha,
        this.descripcion,
        this.personasRequeridas,
        this.asistencias,
        this.fotoRequest,
        this.patrocinadorRequest,
        this.geoubicacionRequest,
    });

    int? idEvento;
    int? idPatrocinador;
    int? idFoto;
    int? idGeoubicacion;
    DateTime? fecha;
    String? descripcion;
    int? personasRequeridas;
    int? asistencias;
    Foto? fotoRequest;
    Patrocinador? patrocinadorRequest;
    Geoubicacion? geoubicacionRequest;

    factory Evento.fromJson(Map<String, dynamic> json) => Evento(
        idEvento: json["idEvento"],
        idPatrocinador: json["idPatrocinador"],
        idFoto: json["idFoto"],
        idGeoubicacion: json["idGeoubicacion"],
        fecha: DateTime.parse(json["fecha"]),
        descripcion: json["descripcion"],
        personasRequeridas: json["personasRequeridas"],
        asistencias: json["asistencias"],
        fotoRequest: Foto.fromJson(json["fotoRequest"]),
        patrocinadorRequest: Patrocinador.fromJson(json["patrocinadorRequest"]),
        geoubicacionRequest: Geoubicacion.fromJson(json["geoubicacionRequest"]),
    );

    Map<String, dynamic> toJson() => {
        "idEvento": idEvento,
        "idPatrocinador": idPatrocinador,
        "idFoto": idFoto,
        "idGeoubicacion": idGeoubicacion,
        "fecha": fecha?.toIso8601String(),
        "descripcion": descripcion,
        "personasRequeridas": personasRequeridas,
        "asistencias": asistencias,
        "fotoRequest": fotoRequest?.toJson(),
        "patrocinadorRequest": patrocinadorRequest?.toJson(),
        "geoubicacionRequest": geoubicacionRequest?.toJson(),
    };
}