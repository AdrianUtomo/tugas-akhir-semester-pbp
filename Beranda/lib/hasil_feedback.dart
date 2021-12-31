import 'dart:convert';

import 'package:beranda/api/api.dart';
import 'package:beranda/models/feedback.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'feedback_page.dart';

class HasilFeedbackPage extends StatelessWidget {
  const HasilFeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FeedbackProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: new MyHasilFeedbackPage(),
        ),
    );
  }
}

class MyHasilFeedbackPage extends StatefulWidget {
  @override
  _MyHasilFeedbackPage createState() => new _MyHasilFeedbackPage();

}

class _MyHasilFeedbackPage extends State<MyHasilFeedbackPage> {
  Future<List<Feedback2>> getRequest() async {
    String url = "https://vaksinfo.herokuapp.com/authentication/json";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    List<Feedback2> feedbacks = [];
    for (var singleFeedback in responseData) {
      Feedback2 feedback = Feedback2(
        name: singleFeedback["name"],
        email: singleFeedback["email"],
        comments: singleFeedback["comments"],
      );

      feedbacks.add(feedback);
    }
    return feedbacks;
  }

  @override
  Widget build(BuildContext context) {
    final todoP = Provider.of<FeedbackProvider>(context);
    String _title = 'Kompilasi Feedback';

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(_title,
                style: TextStyle(
                  fontSize: 23,
                )),
              ],
        ),
        backgroundColor: Colors.red,
        elevation: 5,
      ),
      body:
      FutureBuilder(
        future: getRequest(),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Feedback2> feedbacks = snapshot.data;
            return ListView.builder(
              itemCount: feedbacks.length,
              itemBuilder: (ctx, index) =>
                  feedbackListTile(feedbacks[index], context),
            );
          }
        },
      ),
        // shrinkWrap: true,
        // itemCount: todoP.fb.length,
        // itemBuilder: (BuildContext context, int index) {
        //   return ListTile(
        //       title: Text(
        //         todoP.fb[index].name,
        //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //       ),
        //       subtitle: Text(
        //         todoP.fb[index].comments,
        //         style: TextStyle(fontSize: 15, color: Colors.black),
        //       ),
        //   );
        // },

    );
  }
}
