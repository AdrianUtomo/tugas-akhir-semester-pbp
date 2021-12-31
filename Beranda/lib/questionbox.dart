import 'package:flutter/material.dart';

class QuestionBox extends StatelessWidget {
  
  var _controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffb1b1),
        title: Align(
          alignment: Alignment(1, 1.6),
          child: Image.asset(
            'assets/images/Logo.png',
            height: 50,
            width: 60,
          ),
        ),
      ),
      body: Padding(
      padding: EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(3),
              child: Image.asset(
                'assets/images/question.png',
                width: 200,
                height: 200
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 25.0)),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Ajukan pertanyaan Anda disini",
                labelText: "Question Box",
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffffb1b1)),
              ),
              onPressed: _controller.clear,
              child: Text('Submit'),
            )
          ]
        ),
      ),
        
    );
  }
}


