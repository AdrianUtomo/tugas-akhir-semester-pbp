import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArtikelTambah extends StatelessWidget {
  const ArtikelTambah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: ArtikelTambahPage());
  }
}

class ArtikelTambahPage extends StatefulWidget {
  const ArtikelTambahPage({Key? key}) : super(key: key);

  @override
  ArtikelTambahState createState() => ArtikelTambahState();
}

class ArtikelTambahState extends State<ArtikelTambahPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleField = TextEditingController();
  TextEditingController bodyField = TextEditingController();
  TextEditingController pubDateField = TextEditingController();
  TextEditingController imageUrlField = TextEditingController();
  TextEditingController slugField = TextEditingController();

  Future<void> submit(BuildContext context) async {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    final response = await http.post(
        Uri.parse("https://vaksinfo.herokuapp.com/artikel/article_flutter"),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'title': titleField.text,
          'body': bodyField.text,
          'pubDate': formattedDate,
          'imageUrl': imageUrlField.text,
          'slug': slugField.text,
        }));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: titleField,
                        decoration: const InputDecoration(
                          hintText: "Masukkan judul",
                          labelText: "Judul artikel",
                          icon: Icon(Icons.book),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Judul tidak boleh kosong';
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: bodyField,
                        decoration: const InputDecoration(
                          hintText: "Masukkan body",
                          labelText: "Body artikel",
                          icon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Body boleh kosong';
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: imageUrlField,
                        decoration: const InputDecoration(
                          hintText: "Masukkan url gambar",
                          labelText: "Url gambar artikel",
                          icon: Icon(Icons.image),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'URL gambar tidak boleh kosong';
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: slugField,
                        decoration: const InputDecoration(
                          hintText: "Masukkan slug",
                          labelText: "Slug artikel",
                          icon: Icon(Icons.create_rounded),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Slug tidak boleh kosong';
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
                      if (_formKey.currentState?.validate() ?? true) {
                        showConfirmDialog(context);
                      }
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }

  showConfirmDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    Widget continueButton = TextButton(
      child: const Text("Confirm"),
      onPressed: () {
        submit(context);
        int count = 0;
        Navigator.of(context, rootNavigator: true)
            .popUntil((_) => count++ >= 1);
        showAlertDialog(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("AlertDialog"),
      content: const Text(
          "Apakah anda yakin informasi yang anda berikan sudah sesuai?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        int count = 0;
        Navigator.of(context, rootNavigator: true)
            .popUntil((_) => count++ >= 1);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Selamat"),
      content: const Text("Artikel berhasil disimpan"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
