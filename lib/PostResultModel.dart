import 'dart:convert';
import 'package:http/http.dart' as http;

// |Danila Fitria - Tugas PAPB - HTTP Request|

class PostResultModel {
  final String id;
  final String name;
  final String job;
  final String dibuatPada;

  // Consttrctor
  PostResultModel({
    required this.id,
    required this.name,
    required this.job,
    required this.dibuatPada,
  });

  // Factory Method
  factory PostResultModel.createPostResult(Map<String, dynamic> object) {
    return PostResultModel(
        id: object['id'],
        name: object['name'],
        job: object['job'],
        dibuatPada: object['createdAt']);
  }

  // Function memanggil API
  static Future<PostResultModel> hubungkanAPI(String name, String job) async {
    var url = Uri.parse('https://reqres.in/api/users');
    var response = await http.post(url, body: {"name": name, "job": job});
    var jsonObject = json.decode(response.body);

    return PostResultModel.createPostResult(jsonObject);
  }
}
