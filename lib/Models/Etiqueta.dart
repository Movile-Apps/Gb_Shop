// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Etiqueta etiquetaFromJson(String str) => Etiqueta.fromJson(json.decode(str));

String etiquetaToJson(Etiqueta data) => json.encode(data.toJson());

class Etiqueta {
    Etiqueta({
        this.exito,
        this.mensaje,
        this.data,
    });

    int? exito;
    dynamic mensaje;
    List<Datum>? data;

    factory Etiqueta.fromJson(Map<String, dynamic> json) => Etiqueta(
        exito: json["exito"],
        mensaje: json["mensaje"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "exito": exito,
        "mensaje": mensaje,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
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
    FotoRequest? fotoRequest;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idEtiqueta: json["idEtiqueta"],
        idFoto: json["idFoto"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        fotoRequest: FotoRequest.fromJson(json["fotoRequest"]),
    );

    Map<String, dynamic> toJson() => {
        "idEtiqueta": idEtiqueta,
        "idFoto": idFoto,
        "nombre": nombre,
        "descripcion": descripcion,
        "fotoRequest": fotoRequest!.toJson(),
    };
}

class FotoRequest {
    FotoRequest({
        this.idFoto,
        this.nombre,
        this.url,
    });

    int? idFoto;
    String? nombre;
    String? url;

    factory FotoRequest.fromJson(Map<String, dynamic> json) => FotoRequest(
        idFoto: json["idFoto"],
        nombre: json["nombre"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "idFoto": idFoto,
        "nombre": nombre,
        "url": url,
    };
}
