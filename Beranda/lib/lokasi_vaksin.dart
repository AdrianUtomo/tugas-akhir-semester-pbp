import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'tambahLokasi.dart';

class LokasiVaksinPage extends StatefulWidget {
  @override
  State<LokasiVaksinPage> createState() => _LokasiVaksinPageState();
}

class _LokasiVaksinPageState extends State<LokasiVaksinPage> {

  List<Lokasi> ganteng = [];

  fetchLokasiData() async {
    ganteng = await getLokasiData();
  }

  Future getLokasiData() async{
    var response =
    await http.get(Uri.https('vaksinfo.herokuapp.com', 'lokasi-vaksin/json'));

    var jsonData = jsonDecode(response.body);

    List<Lokasi> lokasi =[];


    for(var i in jsonData) {

      Lokasi lok = Lokasi(
          NamaLokasi: i['fields']['NamaLokasi'],
          RincianDosis: i['fields']['RincianDosis'],
          Alamat: i['fields']['Alamat']);

      lokasi.add(lok);

    }
    print(lokasi.length);
    return lokasi;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchLokasiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Card(child: FutureBuilder(
          future: getLokasiData(),
          builder: (context, snapshot) {
            if(snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('Loading...'),
                ),
              );
            } else
              return ListView.builder(
                  itemCount: ganteng.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: Column(
                        children: [
                          Text(ganteng[i].NamaLokasi),
                          Text(ganteng[i].RincianDosis),
                          Text(ganteng[i].Alamat)
                        ],
                      ) ,
                      // title: Text(ganteng[i].NamaLokasi),
                      // subtitle: Text(ganteng[i].RincianDosis),
                      // trailing: Text(ganteng[i].Alamat),
                    );
                  });
          },
        ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Tambah Lokasi'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xffffb1b1),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => tambahLokasi()),
          );
        },
      ),
    );
  }
}

class Lokasi {
  final String NamaLokasi, RincianDosis, Alamat;

  Lokasi(
      {required this.NamaLokasi,
        required this.RincianDosis,
        required this.Alamat});
}
