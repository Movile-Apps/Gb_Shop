class GeoUbicacion {
    GeoUbicacion({
        this.idGeoubicacion,
        this.latitud,
        this.longitud,
        this.eventoLimpiezas,
        this.reportes,
    });

    int? idGeoubicacion;
    double? latitud;
    double? longitud;
    List<dynamic>? eventoLimpiezas;
    List<dynamic>? reportes;
}
