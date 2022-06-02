// ignore_for_file: camel_case_types

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Redux/dispatcher.dart';
import 'package:myapp/components/images.dart';
import 'package:myapp/screens/Activation_Screen/activation.dart';
import 'package:myapp/screens/Welcome_Screen/welcome.dart';
import 'package:myapp/Redux/actions.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);
  @override
  SignupForm_ createState() => SignupForm_();
}

class SignupForm_ extends State<SignupForm> {
  final formKey = GlobalKey<FormState>();
  final textfieldfocus = FocusNode();

  //###Controllers##
  TextEditingController usermail = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  //###Variables##
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool obscure_ = true;

  //###Fonctions##
  void toggleObscured() {
    setState(() {
      obscure_ = !obscure_;
      if (textfieldfocus.hasPrimaryFocus) return;
      textfieldfocus.canRequestFocus = false;
    });
  }

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Center(
          child: Text(
            "Sign Up",
            style: GoogleFonts.nunito(
                color: Colors.black, fontSize: 40, fontWeight: FontWeight.w900),
          ),
        ),
        Images(imagename: "signup"),
        Form(
          key: formKey,
          child: Column(
            children: [
              Username(),
              SizedBox(
                height: deviceHeight * 0.02,
              ),
              Email(),
              SizedBox(
                height: deviceHeight * 0.02,
              ),
              Password(),
              SizedBox(
                height: deviceHeight * 0.02,
              ),
              Confirmedpassword(),
              const SizedBox(
                height: 30,
              ),
              Passwordhaseightchar(),
              const SizedBox(
                height: 30,
              ),
              Passwordhasanumber(),
              SizedBox(
                height: deviceHeight * 0.03,
              ),
              SignupForm(context),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ]),
    );
  }

  Center Username() {
    return Center(
        child: SizedBox(
      width: deviceWidth * 0.7,
      child: TextFormField(
        controller: username,
        validator: (username) {
          if (username!.isEmpty ||
              !RegExp(r'^[a-z A-Z]+[a-z A-Z 0-9 _]*$').hasMatch(username)) {
            return 'Invalid Username';
          } else {
            return null;
          }
        },
        style: GoogleFonts.nunito(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          // contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
          floatingLabelBehavior:
              FloatingLabelBehavior.never, //Hides label on focus or if filled
          labelText: "Username",
          filled: true, // Needed for adding a fill color
          fillColor: second_color,
          isDense: true, // Reduces height a bit
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // No border
            borderRadius: BorderRadius.circular(20), // Apply corner radius
          ),
          prefixIcon: const Icon(
            Icons.person,
            size: 24,
            color: base_color,
          ),
          suffixIcon: const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
          ),
        ),
      ),
    ));
  }

  Center Email() {
    return Center(
        child: SizedBox(
      width: deviceWidth * 0.7,
      child: TextFormField(
        controller: usermail,
        validator: (email) => email != null && !EmailValidator.validate(email)
            ? 'Invalid Email'
            : null,
        style: GoogleFonts.nunito(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          floatingLabelBehavior:
              FloatingLabelBehavior.never, //Hides label on focus or if filled
          labelText: "Email",
          filled: true, // Needed for adding a fill color
          fillColor: second_color,
          isDense: true, // Reduces height a bit
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // No border
            borderRadius: BorderRadius.circular(20), // Apply corner radius
          ),
          prefixIcon: const Icon(
            Icons.mail,
            size: 24,
            color: base_color,
          ),
          suffixIcon: const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
          ),
        ),
      ),
    ));
  }

  Center Password() {
    return Center(
        child: SizedBox(
      width: deviceWidth * 0.7,
      child: TextFormField(
        controller: password,
        onChanged: (password) => onPasswordChanged(password),
        validator: (password) {
          if (password!.length < 8 ||
              !RegExp(r'^.*[0-9]+.*$').hasMatch(password)) {
            return 'Invalid Password';
          } else {
            return null;
          }
        },
        style: GoogleFonts.nunito(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
        keyboardType: TextInputType.visiblePassword,
        obscureText: obscure_,
        // focusNode: textfieldfocus,
        decoration: InputDecoration(
          floatingLabelBehavior:
              FloatingLabelBehavior.never, //Hides label on focus or if filled
          labelText: "Password",
          filled: true, // Needed for adding a fill color
          fillColor: second_color,
          isDense: true, // Reduces height a bit
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // No border
            borderRadius: BorderRadius.circular(20), // Apply corner radius
          ),
          prefixIcon: const Icon(
            Icons.lock_rounded,
            size: 24,
            color: base_color,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: GestureDetector(
              onTap: toggleObscured,
              child: Icon(
                obscure_
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                color: base_color,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Center Confirmedpassword() {
    return Center(
        child: SizedBox(
      width: deviceWidth * 0.7,
      child: TextFormField(
        controller: confirmpassword,
        validator: (cpassword) {
          if (cpassword!.isEmpty) {
            return 'Please re-enter password';
          }
          if (password.text != confirmpassword.text) {
            return 'Password does not match';
          }
          return null;
        },
        style: GoogleFonts.nunito(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
        keyboardType: TextInputType.visiblePassword,
        obscureText: obscure_,
        // focusNode: textfieldfocus,
        decoration: InputDecoration(
          floatingLabelBehavior:
              FloatingLabelBehavior.never, //Hides label on focus or if filled
          labelText: "Confirm Password",
          filled: true, // Needed for adding a fill color
          fillColor: second_color,
          isDense: true, // Reduces height a bit
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // No border
            borderRadius: BorderRadius.circular(20), // Apply corner radius
          ),
          prefixIcon: const Icon(
            Icons.lock_rounded,
            size: 24,
            color: base_color,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: GestureDetector(
              onTap: toggleObscured,
              child: Icon(
                obscure_
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                color: base_color,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Center Passwordhaseightchar() {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: deviceWidth * 0.16),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: _isPasswordEightCharacters
                        ? Colors.green
                        : Colors.transparent,
                    border: _isPasswordEightCharacters
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Contains at least 8 characters")
            ],
          )
        ],
      ),
    );
  }

  Center Passwordhasanumber() {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: deviceWidth * 0.16),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: _hasPasswordOneNumber
                        ? Colors.green
                        : Colors.transparent,
                    border: _hasPasswordOneNumber
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius:
                        BorderRadius.circular(50)), // pushAndRemoveUntil(
                //     MaterialPageRoute(
                //         builder: (context) => const ActivationPage()),
                //     (route) => false);
                child: const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Contains at least 1 number")
            ],
          )
        ],
      ),
    );
  }

  Center SignupForm(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          onPressed: () {
            final FormisValid = formKey.currentState!.validate();
            if (FormisValid) {
              // StoreProvider.of<AppState>(context)
              //     .dispatch(Usermail_action(usermail.text));
              dispatch(context, Usermail_action, usermail.text);
              // StoreProvider.of<AppState>(context)
              //     .dispatch(Username_action(username.text));
              dispatch(context, Usermail_action, username.text);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const ActivationPage(
                          // usermail: usermail.text,
                          )),
                  (route) => false);
            }
          },
          style: ElevatedButton.styleFrom(
            // shape: const CircleBorder(),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
            primary: base_color,
          ),
          child: Text(
            "SIGN UP",
            style: GoogleFonts.nunito(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
