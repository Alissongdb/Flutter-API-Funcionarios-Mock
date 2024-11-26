import 'dart:convert';
import 'package:be_talent/models/employees_model.dart';
import 'package:http/http.dart' as http;

Future<List<Employee>> fetchEmployees() async {
  final response = await http.get(
    Uri.parse('http://localhost:3000/employees'),
  );

  if (response.statusCode == 200) {
    // Converte o JSON em uma lista de objetos Employee
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((json) => Employee.fromJson(json)).toList();
  } else {
    throw Exception('Falha ao carregar funcionários');
  }
}
