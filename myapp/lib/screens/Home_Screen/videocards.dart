import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/Player_Screen/playerpage.dart';

class VideoCard extends StatelessWidget {
  final Map videoData;
  // ignore: use_key_in_widget_constructors
  const VideoCard(this.videoData);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        height: 280,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 4,
                blurRadius: 6,
                offset: const Offset(0, 3),
              )
            ]),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlayerPage(),
                ),
              );
            },
            child: Thumbnail(),
          ),
          Title(),
        ]));
  }

  Container Title() {
    return Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Text(
            videoData['title'],
            style:
                GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w800),
          ),
        );
  }

  Container Thumbnail() {
    return Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                image: DecorationImage(
                  image: NetworkImage(videoData['thumbnail']),
                  fit: BoxFit.cover,
                )),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 20,
                    width: 50,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        videoData['duration'],
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
