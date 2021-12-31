import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'artikel_list.dart';
import 'cookierequest.dart';
import 'package:provider/provider.dart';
import 'artikel_tambah.dart';

class ArtikelPage extends StatelessWidget {
  const ArtikelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: ArtikelListPage());
  }
}

class Artikel {
  final String title;
  final String body;
  final String pubDate;
  final String imageUrl;
  final String slug;

  Artikel({
    required this.title,
    required this.body,
    required this.pubDate,
    required this.imageUrl,
    required this.slug,
  });
}

class ArtikelListPage extends StatefulWidget {
  const ArtikelListPage({Key? key}) : super(key: key);

  @override
  _ArtikelListState createState() => _ArtikelListState();
}

class ArtikelValues {
  Future<List<Artikel>> getRequest() async {
    String url = "https://vaksinfo.herokuapp.com/artikel/json";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    List<Artikel> artikels = [];
    for (var singleArtikel in responseData) {
      Artikel artikel = Artikel(
        title: singleArtikel["title"],
        body: singleArtikel["body"],
        pubDate: singleArtikel["pub_date"],
        imageUrl: singleArtikel["image_url"],
        slug: singleArtikel["slug"],
      );

      artikels.add(artikel);
    }
    return artikels;
  }
}

class _ArtikelListState extends State<ArtikelListPage> {
  Future<List<Artikel>> getRequest() async {
    String url = "https://vaksinfo.herokuapp.com/artikel/json";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    List<Artikel> artikels = [];
    for (var singleArtikel in responseData) {
      Artikel artikel = Artikel(
        title: singleArtikel["title"],
        body: singleArtikel["body"],
        pubDate: singleArtikel["pub_date"],
        imageUrl: singleArtikel["image_url"],
        slug: singleArtikel["slug"],
      );

      artikels.add(artikel);
    }
    return artikels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getRequest(),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Artikel> artikels = snapshot.data;
            return ListView.builder(
              itemCount: artikels.length,
              itemBuilder: (ctx, index) =>
                  artikelListTile(artikels[index], context),
            );
          }
        },
      ),
      floatingActionButton: context.watch<CookieRequest>().username == "admin"
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ArtikelTambahPage()));
              },
              backgroundColor: const Color(0xffff0000),
              child: const Icon(Icons.add),
            )
          : const SizedBox.shrink(),
    );
  }
}
