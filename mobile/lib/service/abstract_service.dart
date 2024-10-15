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

  String recurso();
}
