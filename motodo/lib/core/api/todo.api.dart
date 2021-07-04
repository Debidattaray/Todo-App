import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:motodo/app/routes/api_urls.dart';
// import 'package:todolistflutternodejs/app/routes/api_urls.dart';

class TodoAPI {
  final client = http.Client();
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };

  Future addTodo({required String title, required String description}) async {
    final subUrl = "/todos/add";
    final Uri uri = Uri.parse(APIRoutes.BASEURL + subUrl);
    final http.Response response = await client.post(uri,
        body: jsonEncode({"title": title, "description": description}),
        headers: headers);
    final statusCode = response.statusCode;
    final body = response.body;
    if (statusCode == 200) {
      return body;
    }
  }

  Future readTodos() async {
    final subUrl = "/todos/";
    final Uri uri = Uri.parse(APIRoutes.BASEURL + subUrl);
    final http.Response response = await client.get(uri, headers: headers);
    final statusCode = response.statusCode;
    final body = response.body;
    if (statusCode == 200) {
      return body;
    }
  }

  Future updateTodo() async {}
  Future deleteTodo({required dynamic id}) async {
    final subUrl = "/todos/delete/$id";
    final Uri uri = Uri.parse(APIRoutes.BASEURL + subUrl);
    final http.Response response = await client.delete(uri, headers: headers);
    final statusCode = response.statusCode;
    final body = response.body;
    if (statusCode == 200) {
      return body;
    }
  }
}
