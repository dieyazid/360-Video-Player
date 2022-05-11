import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/welcome.dart';

class ActivationPage extends StatefulWidget {
  final String usermail;
  const ActivationPage({Key? key, required this.usermail}) : super(key: key);
  @override
  ActivationPage_ createState() => ActivationPage_();
}

// ignore: camel_case_types
class ActivationPage_ extends State<ActivationPage> {
  //** Variables **/
  final formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  bool ButtonActive = false;
  bool pressAttention = false;
  bool countDownComplete = false;
  late Timer _timer;
  int _start = 60;
  //** This function starts the 60sec countdown **/
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
          setState(() => pressAttention = !pressAttention);
          setState(() => ButtonActive = !ButtonActive);
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => startTimer());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const TopSection(),
          SingleChildScrollView(
            child: Column(
              children: [
                Center(
                    child: Stack(children: [
                  Center(
                    child: Image.asset(
                      "assets/mailsent.png",
                      height: deviceHeight * 0.3,
                    ),
                  ),
                  Center(
                    child: Text(
                      "Activation",
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ])),
                Center(
                  child: Text(
                    "$_start",
                    style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 60,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Center(
                  child: Text(
                    "We've sent an email with a confirmation code "
                    "to ${widget.usermail}.\n In order to complete the sign-up"
                    " process, please check your inbox and copy the activation"
                    " code below.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.03,
                ),
                Form(
                  key: formKey,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(children: [
                    Center(
                        child: SizedBox(
                      width: deviceWidth * 0.4,
                      child: TextFormField(
                        validator: (code) => code != null && code.length < 4
                            ? 'Invalid code'
                            : null,
                        style: GoogleFonts.nunito(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior
                              .never, //Hides label on focus or if filled
                          labelText: "Code",
                          filled: true, // Needed for adding a fill color
                          fillColor: second_color,
                          isDense: true, // Reduces height a bit
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none, // No border
                            borderRadius: BorderRadius.circular(
                                20), // Apply corner radius
                          ),
                          prefixIcon: const Icon(
                            Icons.code,
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
                      height: deviceHeight * 0.03,
                    ),
                  ]),
                ),
                SizedBox(
                  height: deviceHeight * 0.03,
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
                                  builder: (context) => const HomePage()),
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
                        "SUBMIT",
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
                      onPressed: ButtonActive
                          ? () {
                              setState(() => _start = 60);
                              startTimer();

                              setState(() => pressAttention = !pressAttention);
                              setState(() => ButtonActive = false);
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                          onSurface: Colors.white,
                          // shape: const CircleBorder(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 80),
                          primary: Colors.white),
                      child: Text.rich(TextSpan(
                        text: "Resend Code",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: "GoogleFonts.nunito",
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: pressAttention ? Colors.black : Colors.grey,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const WelcomePage();
                  }),
                );
              },
              child: const Icon(
                Icons.arrow_back,
                size: 26,
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