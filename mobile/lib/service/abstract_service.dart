import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class AbstractService {
  final String URL = "http://localhost:3000/";

  Future<void> getAll() async {
    var response = await http.get(Uri.parse("$URL${recurso()}"));

    print(response.statusCode);
  }

  Future<void> deleteId(String id) async {
    var response = await http.delete(Uri.parse("$URL${recurso()}/$id"));

    print(response.statusCode);
  }

  Future<void> postAll(dynamic objeto) async {
    var response = await http.post(
      Uri.parse("$URL${recurso()}"),
      body: jsonEncode(objeto),
    );

    if(response.statusCode != 201){
      throw Exception("Erro");
    }
    
  }

  String recurso();
}
