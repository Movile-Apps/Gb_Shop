// To parse this JSON data, do
//
//     final foto = fotoFromJson(jsonString);

import 'dart:convert';

Foto fotoFromJson(String str) => Foto.fromJson(json.decode(str));

String fotoToJson(Foto data) => json.encode(data.toJson());

class Foto {
    Foto({
        this.idFoto,
        this.nombre,
        this.url,
    });

    int? idFoto;
    String? nombre;
    String? url;

    factory Foto.fromJson(Map<String, dynamic> json) => Foto(
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
