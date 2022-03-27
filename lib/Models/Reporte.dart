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
    UsuarioRequest? usuarioRequest;
    EtiquetaRequest? etiquetaRequest;
    FotoRequest? fotoRequest;
    GeoubicacionRequest? geoubicacionRequest;
}

class EtiquetaRequest {
    EtiquetaRequest({
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
    dynamic fotoRequest;
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
}

class UsuarioRequest {
    UsuarioRequest({
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
    dynamic fotoRequest;
}
