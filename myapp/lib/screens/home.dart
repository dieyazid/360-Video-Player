import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              SearchSection(),
              VideoSection(),
            ],
          ),
        ),
      );
}

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height/9,
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
                    primary: color_blue,
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
  final List Videos = [
    {'title': '360 Video',
    'picture':'images/planet.png',
    'duration':'0:20'},
    {'title': '360 Video',
    'picture':'images/delete.png',
    'duration':'0:35'},
    {'title': '360 Video',
    'picture':'images/star.png',
    'duration':'0:35'},
    {'title': '360 Video',
    'picture':'images/login.png',
    'duration':'0:35'},
    
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          children: Videos.map((video) {
            return VideoCard(video);
          }).toList(),
        ));
  }
}

class VideoCard extends StatelessWidget {
  final Map videoData;
  VideoCard(this.videoData);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 210,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(18)),
        boxShadow: [
          BoxShadow(
          color: Colors.grey.shade200,
          spreadRadius: 4,
          blurRadius: 6,
          offset: Offset(0,3),
        )
        ]),
        child: Column(
          children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  videoData['picture']
              ),
                fit: BoxFit.cover,
              )
            ),
            child: 
            Stack(children: [
              Positioned(
                top: 5,
                right: -15,
                child: MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                onPressed: (){},
                child: Icon(
                  Icons.play_arrow,
                  color: color_blue,
                  size: 20,
                ), ))
            ],),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(videoData['title'],
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w800
                ),),
                Text(videoData['duration'],
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w800
                ),),
              ],
            ),
          )

        ]) ,
      
      //child: Image.asset(videoData['picture']
      //)
    );
  }
}