// ignore_for_file: non_constant_identifier_names, must_be_immutable, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Redux/actions.dart';
import 'package:myapp/Redux/appstate.dart';
import 'package:myapp/screens/Welcome_Screen/welcome.dart';



class Button extends StatelessWidget {
  Button(
      {required this.buttontext,
      required this.nextpage,
      this.button_color = base_color,
      this.text_color = Colors.white});
  String buttontext;
  Widget nextpage;
  Color button_color, text_color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return nextpage;
              }),
            );
          },
          style: ElevatedButton.styleFrom(
            // shape: const CircleBorder(),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
            primary: button_color,
          ),
          child: Text(
            buttontext,
            style: GoogleFonts.nunito(
                color: text_color, fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}

class FormButton extends StatelessWidget {
  FormButton(
      {required this.buttontext,
      required this.nextpage,
      required this.formKey,
      required this.sourcepage,
      this.username = "",
      this.usermail = ""});
  String buttontext, sourcepage, username, usermail;
  Widget nextpage;
  GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: ElevatedButton(
                onPressed: () {
                  final FormisValid = formKey.currentState!.validate();
                  if (FormisValid) {
                    if (sourcepage == "signuppage") {
                      StoreProvider.of<AppState>(context)
                          .dispatch(Usermail_action(usermail));
                      StoreProvider.of<AppState>(context)
                          .dispatch(Username_action(username));
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => nextpage),
                          (route) => false);
                    } else {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => nextpage),
                          (route) => false);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  // shape: const CircleBorder(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                  primary: base_color,
                ),
                child: Text(
                  buttontext,
                  style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          );
        });
  }
}
