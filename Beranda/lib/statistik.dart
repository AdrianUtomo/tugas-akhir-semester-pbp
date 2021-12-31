import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'cookierequest.dart';

class Vaccination {
  final int first;
  final int second;

  Vaccination({
    required this.first,
    required this.second,
  });

  factory Vaccination.fromJson(Map<String, dynamic> json) {
    return Vaccination(
      first: json['vaksinasi1'],
      second: json['vaksinasi2'],
    );
  }
}

Future<Vaccination> fetchVaccination() async {
  final response = await http.get(Uri.parse("https://vaksincovid19-api.vercel.app/api/vaksin"));

  if (response.statusCode == 200) {
    return Vaccination.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to fetch vaccination data");
  }
}

class StatistikPage extends StatefulWidget {
  const StatistikPage({Key? key}) : super(key: key);

  @override
  _StatistikPageState createState() => _StatistikPageState();

}

class _StatistikPageState extends State<StatistikPage> {
  late WebViewController _webViewController;
  late Future<Vaccination> vaccinationData;
  int _stackToView = 1;

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    vaccinationData = fetchVaccination();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: Color(0xFF4E3FF1),
          title: FutureBuilder<Vaccination>(
           future: vaccinationData,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return Text("Total vaksinasi di Indonesia: ${snapshot.data!.first + snapshot.data!.second}");
              } else {
                return Text("Total vaksinasi di Indonesia: 0");
              }
           },
          ),
          centerTitle: true,
        ),
      ),
      floatingActionButton: context.watch<CookieRequest>().username == "admin" ? new FloatingActionButton(
        onPressed: () {
          _webViewController.reload();
        },
        backgroundColor: Color(0xffffb1b1),
        child: const Icon(Icons.refresh),
      ) : SizedBox.shrink(),
      body: IndexedStack(
        index: _stackToView,
        children: [
          Column(
            children: <Widget> [
              Expanded(
                  child: WebView(
                    onWebViewCreated: (controller) {
                      _webViewController = controller;
                    },
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: "https://vaksinfo.herokuapp.com/statistik/mobile-view",
                    onPageFinished: _handleLoad,
                  )
              ),
            ],
          ),
          Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      )
    );
  }
}

