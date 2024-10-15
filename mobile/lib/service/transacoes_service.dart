import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/model/transacao.dart';
import 'package:mobile/service/abstract_service.dart';

class TransacoesService extends AbstractService{

  Future<List<Transacao>> getTransacoes() async {
    var response = await http.get(Uri.parse("http://localhost:3000/transacoes"));

    print("Response:  $response");
    print("Body: ${response.body}");
    return response.body;
  }

  Future<void> postTransacoes(double valor,String tipo) async {
    var response = await http.post(Uri.parse("http://localhost:3000/transacoes"),
     headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
    "valor":valor,
    "tipo":tipo
    })
    
    );
  print(response.statusCode);
  print("Response: foi");

  }

  Future<void> putTransacoes() async {
    var response = await http.put(Uri.parse("http://localhost:3000/transacoes/3"),
  body: jsonEncode({
    "id":3,
    "valor": 650.00,
    "tipo":"Debito"
  })

  );

  print("Response: ${response.body}");

  }
  
  @override
  String recurso() {
    return "transacaoes";
  }
  }