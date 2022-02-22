import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false, 
        body: Column(
          mainAxisSize:MainAxisSize.min,
          children: [
            const SizedBox(height:15),
            const SearchSection(),
            VideoSection(),
          ],
        ),
      );
}

class SearchSection extends StatelessWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height/12,
      color:Colors.transparent,
      padding: const EdgeInsets.all(10),
      child:Row(
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                        color: color_blue,
                        blurRadius: 5,
                        offset:  Offset(0, 2),
                      )
                    ]),
                child: const TextField(
                  showCursor: false,
                  decoration: InputDecoration(
                    hintText: 'Video title',
                    contentPadding: EdgeInsets.all(14),
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
                    borderRadius: BorderRadius.all(
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
    );
  }
}
class VideoSection extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final List Videos = [
    {'title': 'Title',
    'picture':'images/panoramic.png',
    'duration':'xx:xx'},
    {'title': 'Title',
    'picture':'images/panoramic.png',
    'duration':'xx:xx'},{'title': 'Title',
    'picture':'images/panoramic.png',
    'duration':'xx:xx'},{'title': 'Title',
    'picture':'images/panoramic.png',
    'duration':'xx:xx'},{'title': 'Title',
    'picture':'images/panoramic.png',
    'duration':'xx:xx'},
    
  ];

 VideoSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height-(size.height/12+15),
        padding: const EdgeInsets.all(10),
        color: const Color(0xFFeaaea),
        child: SingleChildScrollView(
          child: Column(
            children: Videos.map((video) {
              return VideoCard(video);
            }).toList(),
            
          ),
        )
        
        );
  }
}

class VideoCard extends StatelessWidget {
  final Map videoData;
  // ignore: use_key_in_widget_constructors
  const VideoCard(this.videoData);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        boxShadow: [
          BoxShadow(
          color: Colors.grey.shade200,
          spreadRadius: 4,
          blurRadius: 6,
          offset: const Offset(0,3),
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
                shape: const CircleBorder(),
                onPressed: (){},
                child: const Icon(
                  Icons.play_arrow,
                  color: color_blue,
                  size: 20,
                ), ))
            ],),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
          ),
        ]) ,
      
      //child: Image.asset(videoData['picture']
      //)
    );
  }
}