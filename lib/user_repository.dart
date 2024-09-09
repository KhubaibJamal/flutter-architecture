import 'package:architecture/user_json.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserRepository {
  Future<List<UserJson>> getUsers() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);
    var list = jsonDecode(response.body) as List;
    return list.map((e) => UserJson.fromJson(e)).toList();
  }
}
