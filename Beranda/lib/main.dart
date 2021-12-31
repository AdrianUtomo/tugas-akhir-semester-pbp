import 'package:beranda/statistik.dart';
import 'package:beranda/tanya_jawab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'artikel.dart';
import 'dashboard.dart';
import 'info_vaksin.dart';
import 'login.dart';
import 'lokasi_vaksin.dart';
import 'my_drawer_header.dart';
import 'cookierequest.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();

        return request;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;

  void logout() async {
    context.watch<CookieRequest>().clear();
  }

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.artikel) {
      container = ArtikelPage();
    } else if (currentPage == DrawerSections.info_vaksin) {
      container = InfoVaksinPage();
    } else if (currentPage == DrawerSections.lokasi_vaksin) {
      container = LokasiVaksinPage();
    } else if (currentPage == DrawerSections.statistik) {
      container = StatistikPage();
    } else if (currentPage == DrawerSections.tanya_jawab) {
      container = TanyaJawabPage();
    } else if (currentPage == DrawerSections.login) {
      if (context.watch<CookieRequest>().loggedIn == true) {
        print(context.watch<CookieRequest>().username);
        context.watch<CookieRequest>().clear();
        container = LoginPage();
      } else {
        container = LoginPage();
      }
    }
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
      body: container,
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        // show the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Artikel", Icons.article_rounded,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(3, "Info Vaksin", Icons.integration_instructions_rounded,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(4, "Lokasi Vaksin", Icons.location_on_rounded,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(5, "Statistik", Icons.query_stats_rounded,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(6, "Tanya Jawab", Icons.question_answer_rounded,
              currentPage == DrawerSections.dashboard ? true : false),
          Divider(),
          menuItem(7, "Login/Logout", Icons.login_rounded,
              currentPage == DrawerSections.dashboard ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.artikel;
            } else if (id == 3) {
              currentPage = DrawerSections.info_vaksin;
            } else if (id == 4) {
              currentPage = DrawerSections.lokasi_vaksin;
            } else if (id == 5) {
              currentPage = DrawerSections.statistik;
            } else if (id == 6) {
              currentPage = DrawerSections.tanya_jawab;
            } else if (id == 7) {
              currentPage = DrawerSections.login;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  artikel,
  info_vaksin,
  lokasi_vaksin,
  statistik,
  tanya_jawab,
  login
}
