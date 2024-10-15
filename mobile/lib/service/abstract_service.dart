import 'package:http/http.dart' as http;

abstract class AbstractService {

final String URL = "http://localhost:3000/";

  Future<void> getAll() async {
   var response = await http.get(Uri.parse("$URL${recurso()}"));

   print(response);
  }

 String recurso();
}