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

  void addFeedback(Feedback2 feedback2) async {
    final response = await http.post(Uri.parse(
        'https://vaksinfo.herokuapp.com/authentication/json_fb?format=json'),
        headers: {"Content-Type":"application/json"},
        body: json.encode(feedback2));
        if (response.statusCode == 201) {
          feedback2.id = json.decode(response.body)["id"];
          _fb.add(feedback2);
          notifyListeners();
        }
  }

  fetchTasks() async {
    final url = 'https://vaksinfo.herokuapp.com/authentication/json_fb?format=json';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _fb = data.map<Feedback2>((json) => Feedback2.fromJson(json)).toList();
      notifyListeners();
    }
  }
}