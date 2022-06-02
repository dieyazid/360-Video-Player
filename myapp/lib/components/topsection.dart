import 'package:flutter/material.dart';
import 'package:myapp/screens/Welcome_Screen/welcome.dart';

class TopSection extends StatelessWidget {
  // const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight / 16,
      color: Colors.transparent,
      // padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            height: deviceHeight * 0.001,
          ),
          Container(
            height: 50,
            width: 80,
            decoration: const BoxDecoration(
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey,
                //     blurRadius: 4,
                //     offset: Offset(0, 4),
                //   )
                // ],
                borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
            child: ElevatedButton(
              key: const Key("back_button"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const WelcomePage();
                  }),
                );
              },
              child: Icon(
                Icons.arrow_back,
                size: deviceHeight * 0.04,
              ),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
                primary: base_color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
