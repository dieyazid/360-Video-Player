import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/Welcome_Screen/welcome.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
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
    return Center(
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
}

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: deviceWidth * 0.7,
      child: TextFormField(
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
}
