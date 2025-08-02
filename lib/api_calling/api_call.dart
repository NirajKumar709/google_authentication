import 'dart:convert';

import 'package:google_authentication/api_calling/data_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<User>> fetchUsers() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );

    print(response.statusCode);
    print(jsonDecode(response.body));
    print(response.runtimeType);
    print("_____________________________________");

    if (response.statusCode == 200) {
      final List<dynamic> decodedData = jsonDecode(response.body);

      print(decodedData.runtimeType);
      print(decodedData.length);
      print("__________________________________________");

      return decodedData.map((data) => User.fromJson(data)).toList();
    } else {
      throw Exception("Filed to load users.${response.statusCode}");
    }
  }
}
