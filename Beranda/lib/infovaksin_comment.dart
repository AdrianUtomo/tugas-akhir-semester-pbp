import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfovaksinComment extends StatelessWidget {
  const InfovaksinComment({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false, home: InfovaksinCommentPage());
  }
}

class InfovaksinCommentPage extends StatefulWidget {
  const InfovaksinCommentPage({ Key? key }) : super(key: key);

  @override
  _InfovaksinCommentPageState createState() => _InfovaksinCommentPageState();
}

class _InfovaksinCommentPageState extends State<InfovaksinCommentPage> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController nameField = TextEditingController();
  TextEditingController contentField = TextEditingController();

  Future<void> submitComment(BuildContext context) async {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    final response = await http.post(
      Uri.parse("https://vaksinfo.herokuapp.com/infovaksin/infovaksin_comment"),
      body: jsonEncode(<String, dynamic> {
        'name' : nameField.text,
        'content': contentField.text,
        'date' : formattedDate
      })
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: nameField,
                        decoration: const InputDecoration(
                          hintText: "Masukkan Nama",
                          labelText: "Nama Pengguna",
                          icon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Nama tidak boleh kosong';
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: contentField,
                        decoration: const InputDecoration(
                          hintText: "Masukkan Komentar",
                          labelText: "Komentar anda",
                          icon: Icon(Icons.comment),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Komentar tidak boleh kosong';
                          }
                          return null;
                        }),
                  ),
                  ElevatedButton(
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formkey.currentState?.validate() ?? true) {
                        final snackBar = SnackBar(
                          duration: const Duration(seconds: 5),
                          content: Text(
                              "Berhasil menambahkan komentar, silakan lihat komentar anda di website Vaksinfo"),
                          backgroundColor: Colors.green,
                        );
                        submitComment(context);
                        nameField.clear();
                        contentField.clear();
                        FocusScope.of(context).requestFocus(FocusNode());
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // showConfirmDialog(BuildContext context) {
  //   // set up the buttons
  //   Widget cancelButton = TextButton(
  //     child: const Text("Cancel"),
  //     onPressed: () {
  //       Navigator.of(context).pop();
  //     },
  //   );

  //   Widget continueButton = TextButton(
  //     child: const Text("Confirm"),
  //     onPressed: () {
  //       submitComment(context);
  //       int count = 0;
  //       Navigator.of(context).popUntil((_) => count++ >= 1);
  //       showAlertDialog(context);
  //     },
  //   );

  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: const Text("AlertDialog"),
  //     content: const Text(
  //         "Apakah anda yakin informasi yang anda berikan sudah sesuai?"),
  //     actions: [
  //       cancelButton,
  //       continueButton,
  //     ],
  //   );

  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  // showAlertDialog(BuildContext context) {
  //   // set up the button
  //   Widget okButton = TextButton(
  //     child: const Text("OK"),
  //     onPressed: () {
  //       int count = 0;
  //       Navigator.of(context).popUntil((_) => count++ >= 1);
  //     },
  //   );

  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: const Text("Selamat"),
  //     content: const Text("Komentar berhasil disimpan"),
  //     actions: [
  //       okButton,
  //     ],
  //   );

  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }
}