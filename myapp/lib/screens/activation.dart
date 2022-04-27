import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/main.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/welcome.dart';

class ActivationPage extends StatefulWidget {
  const ActivationPage({Key? key}) : super(key: key);
  @override
  ActivationPage_ createState() => ActivationPage_();
}

// ignore: camel_case_types
class ActivationPage_ extends State<ActivationPage> {
  final formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  bool ButtonActive = false;
  bool pressAttention = false;
  bool countDownComplete = false;
  late Timer _timer;
int _start = 5;

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
                          setState(() =>
                            ButtonActive =!ButtonActive); 
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
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => startTimer());
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
            // alignment: Alignment.center,
            children: [
              Row(
                children: [
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
                        primary: color_blue,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Center(
                      child: Image.asset(
                    "assets/mailsent.png",
                    height: size.height * 0.3,
                  )),
                  Center(
                    child: Text(
                      "Activation",
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 60,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
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
                      "We\'ve sent you an email containing your activation code\n Please check your inbox and copy the code below",
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Form(
                    key: formKey,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(children: [
                      Center(
                          child: SizedBox(
                        width: size.width * 0.3,
                        child: TextFormField(
                          validator: (code) =>
                              code != null && code.length<4 
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
                            fillColor: color_lightblue,
                            isDense: true, // Reduces height a bit
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none, // No border
                              borderRadius: BorderRadius.circular(
                                  20), // Apply corner radius
                            ),
                            prefixIcon: const Icon(
                              Icons.code,
                              size: 24,
                              color: color_blue,
                            ),
                            suffixIcon: const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                            ),
                          ),
                        ),
                      )),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
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
                          primary: color_blue,
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
                        ?() {
                          setState(() => _start =5 );
                          startTimer();
                          
                          setState(() => pressAttention = !pressAttention);
                          setState(() =>
                            ButtonActive =false); 
                        }
                        :null,
                        style: ElevatedButton.styleFrom(
                          onSurface: Colors.white,
                            // shape: const CircleBorder(),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 80),
                            primary: Colors.white),
                        child:  Text.rich(
                          TextSpan(
                          text: "Resend Code",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: "GoogleFonts.nunito",
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: pressAttention ? Colors.black : Colors.grey,),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
