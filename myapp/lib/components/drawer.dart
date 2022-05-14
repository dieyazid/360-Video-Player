// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:myapp/redux/appstate.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/welcome.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ;
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: StoreConnector<AppState, AppState>(
                  converter: (store) => store.state,
                  builder: (context, state) {
                    return
                    Column(children: [
                      Text(
                        "${state.Username_state}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        "assets/user.png",
                        height: 90,
                      ),
                    ]);
                  }),
            ),
            // SizedBox(
            //   height: 45,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) {
            //           return const HomePage();
            //         }),
            //       );
            //     },
            //     child: Row(children: const [
            //       Icon(
            //         Icons.settings,
            //         color: Colors.black,
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Text(
            //         'Refresh List',
            //         style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.w700,
            //           color: Colors.black,
            //         ),
            //       ),
            //     ]),
            //     style: ElevatedButton.styleFrom(
            //       primary: Colors.white,
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const WelcomePage();
                    }),
                  );
                },
                child: Row(children: const [
                  Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ]),
                style: ElevatedButton.styleFrom(primary: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
