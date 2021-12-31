import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/feedback.dart';
import 'package:http/http.dart' as http;

class FeedbackProvider with ChangeNotifier {
  FeedbackProvider() {
    this.fetchTasks();
  }
  List<Feedback2> _fb = [];

  List<Feedback2> get fb {
    return[..._fb];
  }

  // Mengirim feedback dari input user ke Django database (json format)
  void addFeedback(Feedback2 feedback2) async {
    final response = await http.post(Uri.parse(
        'https://vaksinfo.herokuapp.com/authentication/json'),
        headers: {"Content-Type":"application/json"},
        body: json.encode(feedback2));
        if (response.statusCode == 201) {
          // feedback2.id = json.decode(response.body)["id"];
          _fb.add(feedback2);
          notifyListeners();
        }
  }

  // Mengambil data dari Django database (json format) untuk ditampilkan di UI
  fetchTasks() async {
    final url = 'https://vaksinfo.herokuapp.com/authentication/json';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _fb = data.map<Feedback2>((json) => Feedback2.fromJson(json)).toList();
      notifyListeners();
    }
  }
}