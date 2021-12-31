import 'package:flutter/material.dart';

class tambahLokasi extends StatelessWidget {

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

              ),

              TextField(

                decoration: InputDecoration(
                  hintText: "Isi Nama Lokasi Disini",
                  labelText: "Nama Lokasi",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 25.0)),


              TextField(

                decoration: InputDecoration(
                  hintText: "Isi Alamat Disini",
                  labelText: "Jenis Vaksin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 25.0)),

              TextField(
                decoration: InputDecoration(
                  hintText: "Isi Rincian Dosis Disini",
                  labelText: "Rincian Dosis",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 25.0)),
              TextField(

                decoration: InputDecoration(
                  hintText: "Isi Alamat Disini",
                  labelText: "Alamat",
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
                child: Text('Tambah'),
              )
            ]
        ),
      ),


    );
  }
}


