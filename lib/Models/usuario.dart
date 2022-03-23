class Usuario {
    Usuario({
        this.idFoto,
        this.nombre,
        this.apellido,
        this.correo,
        this.contrasenia,
    });

    int? idFoto;
    String? nombre;
    String? apellido;
    String? correo;
    String? contrasenia;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        idFoto: json["id_foto"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        correo: json["correo"],
        contrasenia: json["contrasenia"],
    );

    Map<String, dynamic> toJson() => {
        "id_foto": idFoto,
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
        "contrasenia": contrasenia,
    };
}
