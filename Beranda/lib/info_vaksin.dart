import 'package:beranda/info_vaksin_detail.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class InfoVaksinPage extends StatelessWidget {
  const InfoVaksinPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, home: InfoVaksinList(),
    );
  }
}

//Creating a class Vaksin to store the data;
class Vaksin {
 final String name;
 final List<dynamic> syarat;
 final String dosis;
 final List<dynamic> efek;

 Vaksin({
   required this.name,
   required this.syarat,
   required this.dosis,
   required this.efek,
 });
}

class InfoVaksinList extends StatefulWidget {

  @override
  State<InfoVaksinList> createState() => _InfoVaksinListState();
}

class _InfoVaksinListState extends State<InfoVaksinList> {

   Future<List<Vaksin>> getVaksinData() async {
   //replace your restFull API here.
   String url = "https://vaksinfo.herokuapp.com/infovaksin/show_json";
   final response = await http.get(Uri.parse(url));

   var responseData = json.decode(response.body);

   //Creating a list to store input data;
   List<Vaksin> vaksins = [];
   for (var singleVaksin in responseData["datas"]) {
     Vaksin user = Vaksin(
         name: singleVaksin["name"],
         syarat: singleVaksin["syarat"],
         dosis: singleVaksin["dosis"],
         efek: singleVaksin["efek"],
     );

     //Adding user to the list.
     vaksins.add(user);
   }
  return vaksins;
 }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: getVaksinData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else {
          List<Vaksin> vaksindatas = snapshot.data;
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardBuilder(namavaksin: 'Sinovac', vaksindata: vaksindatas[0]),
                    CardBuilder(namavaksin: "Astrazeneca", vaksindata: vaksindatas[1])
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardBuilder(namavaksin: 'Sinopharm', vaksindata: vaksindatas[2]),
                    CardBuilder(namavaksin: 'Moderna', vaksindata: vaksindatas[3])
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardBuilder(namavaksin: 'Pfizer', vaksindata: vaksindatas[4]),
                    CardBuilder(namavaksin: 'Novavax', vaksindata: vaksindatas[5])
                  ],
                )
              ],
            )
          );
        }
      },
    );
  }
}


class CardBuilder extends StatelessWidget {
  const CardBuilder({
    Key? key,
    required this.namavaksin,
    required this.vaksindata,
  }) : super(key: key);

  final String namavaksin;
  final Vaksin vaksindata;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => vaksinDetails(context: context, datas: vaksindata),
        ));
      },
      child: Card(
        color: Color(0xffffb1b1),
        elevation: 5,
        child: SizedBox(
          height: 120,
          width: 120,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              namavaksin,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
          ),
        ),
      ),
    );
  }
}
