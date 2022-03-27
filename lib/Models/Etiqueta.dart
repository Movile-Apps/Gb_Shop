// To parse this JSON data, do
//
//     final response = responseFromJson(jsonString);

import 'dart:convert';

Response responseFromJson(String str) => Response.fromJson(json.decode(str));

String responseToJson(Response data) => json.encode(data.toJson());

class Response {
    Response({
        this.exito,
        this.mensaje,
        this.data,
    });

    int? exito;
    String? mensaje;
    List<Etiqueta>? data;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        exito: json["exito"],
        mensaje: json["mensaje"],
        data: List<Etiqueta>.from(json["data"].map((x) => Etiqueta.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "exito": exito,
        "mensaje": mensaje,
        //"data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

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
    FotoRequest? fotoRequest;

    factory Etiqueta.fromJson(Map<String, dynamic> json) => Etiqueta(
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
        "fotoRequest": fotoRequest?.toJson(),
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