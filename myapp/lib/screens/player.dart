import 'package:flutter/material.dart';
import 'package:myapp/components/drawer.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/welcome.dart';

class PlayerPage extends StatefulWidget {
  // final String videotitle, videoduration;
  // required this.videotitle,required this.videoduration
  const PlayerPage({Key? key, }) : super(key: key);
  @override
  PlayerPage_ createState() => PlayerPage_();
}

// ignore: camel_case_types
class PlayerPage_ extends State<PlayerPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(deviceHeight*0.07), 
        child:AppBar(backgroundColor: base_color,
        title: const Center(child: Text("Panorama Video Player")),
        actions: [
          ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const HomePage();
                    }),
                  );
                },
                child: const Icon(
                  Icons.home,
                  size: 26,
                ),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                  primary: base_color,
                ),
              ),
        ],
        ),
      ),
      drawer: const Drawer(
        
        child: DrawerList(),
      ),
      body: Column(
        children: [Container(
          height: deviceHeight/3,
          width: deviceWidth,
          color: Colors.amber,
          padding: const EdgeInsets.all(10),
          
        ),
        Container(
          height: deviceHeight - ((deviceHeight/3+deviceHeight*0.07 )),
          width: deviceWidth,
          color: Colors.blue,
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: const[
                
              ],
            ),),
        ),]
      )
    );
  }
}

