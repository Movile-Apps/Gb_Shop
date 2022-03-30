//String responseToJson(ResponseList data) => json.encode(data.toJson());

class ResponseList {
    ResponseList({
        this.exito,
        this.mensaje,
        this.data,
    });

    int? exito;
    String? mensaje;
    List<dynamic>? data;

    
}
