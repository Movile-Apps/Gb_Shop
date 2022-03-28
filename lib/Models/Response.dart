//String responseToJson(Response data) => json.encode(data.toJson());

class Response {
    Response({
        this.exito,
        this.mensaje,
        this.data,
    });

    int? exito;
    String? mensaje;
    List<dynamic>? data;

    
}
