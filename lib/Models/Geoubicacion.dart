// To parse this JSON data, do
//
//     final geoubicacion = geoubicacionFromJson(jsonString);

import 'dart:convert';

Geoubicacion geoubicacionFromJson(String str) => Geoubicacion.fromJson(json.decode(str));

String geoubicacionToJson(Geoubicacion data) => json.encode(data.toJson());

class Geoubicacion {
    Geoubicacion({
        this.idGeoubicacion,
        this.latitud,
        this.longitud,
    });

    int? idGeoubicacion;
    double? latitud;
    double? longitud;

    factory Geoubicacion.fromJson(Map<String, dynamic> json) => Geoubicacion(
        idGeoubicacion: json["idGeoubicacion"],
        latitud: json["latitud"].toDouble(),
        longitud: json["longitud"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "idGeoubicacion": idGeoubicacion,
        "latitud": latitud,
        "longitud": longitud,
    };
}