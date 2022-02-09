import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/all.dart';
const c_green = Color(0xFF45cbb8);
const g = Color.fromARGB(230, 189, 209, 206);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '360 Video Player',
        home: HomePage());
  }
}






class HomePage extends StatefulWidget {
  @override
  HomePages createState() => HomePages();
}

class HomePages extends State<HomePage> {
  @override
  int index = 0;
  final pages = [Home(), Cloud(), const Local()];
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: pages[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Color(0xFFfff4eb),
              height: 60,
              backgroundColor: c_green,
              labelTextStyle: MaterialStateProperty.all(
                const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )),
          child: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.home,
                  color: g,
                ),
                label: 'Home',
                selectedIcon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.cloud,
                  color: g,
                ),
                label: 'Cloud',
                selectedIcon: Icon(
                  Icons.cloud,
                  color: Colors.white,
                ),
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.folder,
                  color: g,
                ),
                label: 'Local',
                selectedIcon: Icon(
                  Icons.folder,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        '360VP',
        style: GoogleFonts.nunito(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
    );
  }
}

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: const Color(0xFFeaeaea),
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: const Offset(0, 1),
                      )
                    ]),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Video title',
                    contentPadding: const EdgeInsets.all(10),
                    border: InputBorder.none,
                  ),
                ),
              )),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      )
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    )),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.search,
                    size: 26,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    primary: c_green,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class VideoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2000,
      color: Colors.white,
    );
  }
}