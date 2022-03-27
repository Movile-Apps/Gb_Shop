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
    FotoRequest? fotoRequest;
    PatrocinadorRequest? patrocinadorRequest;
    GeoubicacionRequest? geoubicacionRequest;

    factory Evento.fromJson(Map<String, dynamic> json) => Evento(
        idEvento: json["idEvento"],
        idPatrocinador: json["idPatrocinador"],
        idFoto: json["idFoto"],
        idGeoubicacion: json["idGeoubicacion"],
        fecha: DateTime.parse(json["fecha"]),
        descripcion: json["descripcion"],
        personasRequeridas: json["personasRequeridas"],
        asistencias: json["asistencias"],
        fotoRequest: FotoRequest.fromJson(json["fotoRequest"]),
        patrocinadorRequest: PatrocinadorRequest.fromJson(json["patrocinadorRequest"]),
        geoubicacionRequest: GeoubicacionRequest.fromJson(json["geoubicacionRequest"]),
    );

    Map<String, dynamic> toJson() => {
        "idEvento": idEvento,
        "idPatrocinador": idPatrocinador,
        "idFoto": idFoto,
        "idGeoubicacion": idGeoubicacion,
        "fecha": fecha/*.toIso8601String()*/,
        "descripcion": descripcion,
        "personasRequeridas": personasRequeridas,
        "asistencias": asistencias,
        "fotoRequest": fotoRequest/*.toJson()*/,
        "patrocinadorRequest": patrocinadorRequest/*.toJson()*/,
        "geoubicacionRequest": geoubicacionRequest/*.toJson()*/,
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

class GeoubicacionRequest {
    GeoubicacionRequest({
        this.idGeoubicacion,
        this.latitud,
        this.longitud,
    });

    int? idGeoubicacion;
    double? latitud;
    double? longitud;

    factory GeoubicacionRequest.fromJson(Map<String, dynamic> json) => GeoubicacionRequest(
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

class PatrocinadorRequest {
    PatrocinadorRequest({
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
    dynamic fotoRequest;

    factory PatrocinadorRequest.fromJson(Map<String, dynamic> json) => PatrocinadorRequest(
        idPadrocinador: json["idPadrocinador"],
        idFoto: json["idFoto"],
        nombre: json["nombre"],
        email: json["email"],
        telefono: json["telefono"],
        fotoRequest: json["fotoRequest"],
    );

    Map<String, dynamic> toJson() => {
        "idPadrocinador": idPadrocinador,
        "idFoto": idFoto,
        "nombre": nombre,
        "email": email,
        "telefono": telefono,
        "fotoRequest": fotoRequest,
    };
}
