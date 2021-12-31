import 'package:beranda/api/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        // toolbarHeight: 20,
        elevation: 5,
      ),
      body:
      ListView.builder(
        shrinkWrap: true,
        itemCount: todoP.fb.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(
                todoP.fb[index].name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                todoP.fb[index].comments,
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
          );
        },
      ),
    );
  }
}
