//String responseToJson(ResponseList data) => json.encode(data.toJson());

class Response {
    Response({
        this.exito,
        this.mensaje,
        this.data,
    });

    int? exito;
    String? mensaje;
    dynamic data;
}
