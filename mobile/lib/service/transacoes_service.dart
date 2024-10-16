import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/model/transacao.dart';
import 'package:mobile/service/abstract_service.dart';

class TransacoesService extends AbstractService {

  Future<List<Transacao>> getTransacoes() async {
    var response =
        await http.get(Uri.parse("http://localhost:3000/transacoes"));

    print("Response:  $response");
    print("Body: ${response.body}");

    List<dynamic> body = jsonDecode(response.body);

    return body.map((dynamic item) => Transacao.fromJson(item)).toList();
  }


  

  Future<void> putTransacoes(double novoValor,String novoTipo,String id) async {
    var response = await http.put(
        Uri.parse("http://localhost:3000/transacoes/$id"),
        body: jsonEncode({"id": id, "valor": novoValor, "tipo": novoTipo}));

    print("Response: ${response.body}");
  }

  @override
  String recurso() {
    return "transacoes";
  }

  @override
  Future<void> deleteId(String id) {
    return super.deleteId(id);
  }


  @override
  Future<void> postAll(dynamic objeto) {
    return super.postAll(objeto.toJson());
  }


}
