import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/activation.dart';
import 'package:myapp/screens/forgotpass.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/welcome.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  LoginForm_ createState() => LoginForm_();
}

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);
  @override
  SignupForm_ createState() => SignupForm_();
}

// ignore: camel_case_types
class LoginForm_ extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final textfieldfocus = FocusNode();
  bool obscure_ = true;
  void toggleObscured() {
    setState(() {
      obscure_ = !obscure_;
      if (textfieldfocus.hasPrimaryFocus) return;
      textfieldfocus.canRequestFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
        Center(
          child: Stack(
            children: [
              Center(
                child: Image.asset(
              "assets/login.png",
              height: deviceHeight * 0.3,
            )),
            ]
            ),
        ),
        Center(
          child: Text(
            "Login",
            style: GoogleFonts.nunito(
                color: Colors.black,
                fontSize: 60,
                fontWeight: FontWeight.w900),
          ),
        ),
        Form(
          key: formKey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(children: [
            Center(
                child: SizedBox(
              width: deviceWidth * 0.7,
              child: TextFormField(
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Invalid Email'
                        : null,
                style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior
                      .never, //Hides label on focus or if filled
                  labelText: "Email",
                  filled: true, // Needed for adding a fill color
                  fillColor: second_color,
                  isDense: true, // Reduces height a bit
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, // No border
                    borderRadius: BorderRadius.circular(
                        20), // Apply corner radius
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
            )),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            Center(
                child: SizedBox(
              width: deviceWidth * 0.7,
              child: TextFormField(
                validator: (password) {
                  if (password!.length < 8) {
                    return 'Invalid Password';
                  } else {
                    return null;
                  }
                },
                style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                keyboardType: TextInputType.visiblePassword,
                obscureText: obscure_,
                // focusNode: textfieldfocus,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior
                      .never, //Hides label on focus or if filled
                  labelText: "Password",
                  filled: true, // Needed for adding a fill color
                  fillColor: second_color,
                  isDense: true, // Reduces height a bit
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, // No border
                    borderRadius: BorderRadius.circular(
                        20), // Apply corner radius
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
            )),
          ]),
        ),
        SizedBox(
          height: deviceHeight * 0.02,
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: ElevatedButton(
              onPressed: () {
                // ignore: non_constant_identifier_names
                final FormisValid = formKey.currentState!.validate();
                if (FormisValid) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => HomePage()),
                      (route) => false);
                }
              },
              style: ElevatedButton.styleFrom(
                // shape: const CircleBorder(),
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: 80),
                primary: base_color,
              ),
              child: Text(
                "LOGIN",
                style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ForgotPassword();
                  }),
                );
              },
              style: ElevatedButton.styleFrom(
                  // shape: const CircleBorder(),
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 80),
                  primary: Colors.white),
              child: const Text.rich(TextSpan(
                text: "Forgot Password?",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontFamily: "GoogleFonts.nunito",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )),
            ),
          ),
        ),
        ]),
    );
  }
}

class SignupForm_ extends State<SignupForm> {
  final formKey = GlobalKey<FormState>();
  final textfieldfocus = FocusNode();
  TextEditingController usermail = TextEditingController();
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool obscure_ = true;
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

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
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
        Center(
            child: Stack(children: [
          Center(
            child: Image.asset(
              "assets/signup.png",
              height: deviceHeight * 0.3,
              width: deviceWidth / 1.5,
            ),
          ),
          Center(
            child: Text(
              "Sign Up",
              style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ])),
        Form(
          key: formKey,
          child: Column(children: [
            Center(
                child: SizedBox(
              width: deviceWidth * 0.7,
              child: TextFormField(
                validator: (username) {
                  if (username!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+[a-z A-Z 0-9 _]*$')
                          .hasMatch(username)) {
                    return 'Invalid Username';
                  } else {
                    return null;
                  }
                },
                style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  // contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                  floatingLabelBehavior: FloatingLabelBehavior
                      .never, //Hides label on focus or if filled
                  labelText: "Username",
                  filled: true, // Needed for adding a fill color
                  fillColor: second_color,
                  isDense: true, // Reduces height a bit
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, // No border
                    borderRadius:
                        BorderRadius.circular(20), // Apply corner radius
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
            )),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            Center(
                child: SizedBox(
              width: deviceWidth * 0.7,
              child: TextFormField(
                controller: usermail,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Invalid Email'
                        : null,
                style: GoogleFonts.nunito(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior
                      .never, //Hides label on focus or if filled
                  labelText: "Email",
                  filled: true, // Needed for adding a fill color
                  fillColor: second_color,
                  isDense: true, // Reduces height a bit
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, // No border
                    borderRadius:
                        BorderRadius.circular(20), // Apply corner radius
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
            )),
            SizedBox(
                height: deviceHeight * 0.02,
              ),
              Center(
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
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: obscure_,
                  // focusNode: textfieldfocus,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior
                        .never, //Hides label on focus or if filled
                    labelText: "Password",
                    filled: true, // Needed for adding a fill color
                    fillColor: second_color,
                    isDense: true, // Reduces height a bit
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none, // No border
                      borderRadius:
                          BorderRadius.circular(20), // Apply corner radius
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
              )),
                    SizedBox(
                  height: deviceHeight * 0.02,
                ),
                Center(
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
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: obscure_,
                    // focusNode: textfieldfocus,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior
                          .never, //Hides label on focus or if filled
                      labelText: "Confirm Password",
                      filled: true, // Needed for adding a fill color
                      fillColor: second_color,
                      isDense: true, // Reduces height a bit
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none, // No border
                        borderRadius:
                            BorderRadius.circular(20), // Apply corner radius
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
                )),
                      const SizedBox(
                  height: 30,
                ),
                Center(
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
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
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
                                borderRadius: BorderRadius.circular(
                                    50)), // pushAndRemoveUntil(
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
                ),
                SizedBox(
                  height: deviceHeight * 0.03,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: ElevatedButton(
                      onPressed: () {
                        final FormisValid = formKey.currentState!.validate();
                        if (FormisValid) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => ActivationPage(
                                        usermail: usermail.text,
                                      )),
                              (route) => false);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        // shape: const CircleBorder(),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 80),
                        primary: base_color,
                      ),
                      child: Text(
                        "SIGN UP",
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
      
          
    
        ]),);
  }
}
