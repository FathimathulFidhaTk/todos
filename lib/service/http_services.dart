import 'package:http/http.dart' as http;
import '../model/todos_model.dart';

class HttpService {

  static Future<List<TodosModel>> todosList() async {
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));

    if (response.statusCode == 200) {
      var data = response.body;
      return TodosModelFromJson(data);
    } else {
      throw Exception();

    }
  }
}