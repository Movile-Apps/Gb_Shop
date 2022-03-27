class Usuario {
    Usuario({
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
