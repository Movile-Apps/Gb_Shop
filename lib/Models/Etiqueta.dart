class Etiqueta {
    Etiqueta({
        this.exito,
        this.mensaje,
        this.data,
    });

    int? exito;
    dynamic mensaje;
    List<Datum>? data;
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