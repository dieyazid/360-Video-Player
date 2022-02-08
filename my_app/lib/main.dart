import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_manager/file_manager.dart';

const c_green = Color(0xFF45cbb8);
const g = Color.fromARGB(146, 189, 209, 206);
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

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchSection(),
              VideoSection(),
            ],
          ),
        ),
      );
}

class Cloud extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(body: Container());
}

class Local extends StatelessWidget {
  final FileManagerController controller = FileManagerController();
  late File file;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: FileManager(
          controller: controller,
          builder: (context, snapshot) {
            final List<FileSystemEntity> entities = snapshot;
            return ListView.builder(
              itemCount: entities.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: FileManager.isFile(entities[index])
                        ? Icon(Icons.feed_outlined)
                        : Icon(Icons.folder),
                    title: Text(FileManager.basename(entities[index])),
                    onTap: () {
                      if (FileManager.isDirectory(entities[index])) {
                        controller
                            .openDirectory(entities[index]); // open directory
                      } else {
                        file = File(entities[index].path);
                        print(file.path);
                      }
                    },
                  ),
                );
              },
            );
          },
        ),
      );
}

class HomePages extends State<HomePage> {
  @override
  int index = 0;
  final pages = [Home(), Cloud(), Local()];
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: pages[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              //indicatorColor: Color(0xFFfff4eb),
              height: 60,
              backgroundColor: c_green,
              labelTextStyle: MaterialStateProperty.all(
                TextStyle(
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
      color: Color(0xFFeaeaea),
      padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(0, 1),
                      )
                    ]),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Video title',
                    contentPadding: EdgeInsets.all(10),
                    border: InputBorder.none,
                  ),
                ),
              )),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      )
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    )),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.search,
                    size: 26,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
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
