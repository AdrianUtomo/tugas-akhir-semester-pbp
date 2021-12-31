import 'package:beranda/models/feedback.dart';
import 'package:flutter/material.dart';

Widget feedbackListTile(Feedback2 feedback, BuildContext context) {
  return ListTile(
    title: Text(feedback.name),
    subtitle: Text(feedback.email),

  );
}