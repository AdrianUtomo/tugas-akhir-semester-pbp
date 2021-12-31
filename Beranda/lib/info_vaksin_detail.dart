import 'package:flutter/material.dart';
import 'dart:convert';
import 'info_vaksin.dart';
import 'package:http/http.dart' as http;


class vaksinDetails extends StatelessWidget {
  const vaksinDetails({
    Key? key,
    required this.context,
    required this.datas
  }) : super(key: key);

  final BuildContext context;
  final Vaksin datas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card (
          elevation: 5,
          child : SizedBox(
            height: 320,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text(
                      datas.name,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                      ),
                      ),
                    Divider(
                      height: 3,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Syarat",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: datas.syarat.map((data) => Text(data)).toList(),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Dosis",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                    Text(datas.dosis),
                    SizedBox(height: 20),
                    Text(
                      "Efek Samping",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: datas.efek.map((data) => Text(data)).toList(),
                    )
                  ],
                ),
              )
          )
        )
      ),
    );
  }
}