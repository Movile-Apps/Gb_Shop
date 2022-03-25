class Reporte {
    Reporte({
        this.idusuario,
        this.idetiqueta,
        this.idfoto,
        this.idgeoubicacion,
        this.fecha,
        this.descripcion
    });

    int? idusuario;
    int? idetiqueta;
    int? idfoto;
    int? idgeoubicacion;
    String? fecha;
    String? descripcion;

    factory Reporte.fromJson(Map<String, dynamic> json) => Reporte(
        idusuario: json["id_usuario"],
        idetiqueta: json["id_etiqueta"],
        idfoto: json["id_foto"],
        idgeoubicacion: json["id_geoubicacion"],
        fecha: json["fecha"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "id_usuario": idusuario,
        "id_etiqueta": idetiqueta,
        "id_foto": idfoto,
        "id_geoubicacion": idgeoubicacion,
        "fecha": fecha,
        "descripcion": descripcion,
    };
}
