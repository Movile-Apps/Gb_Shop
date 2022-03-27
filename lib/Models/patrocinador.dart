class Patrocinador {
    Patrocinador({
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
