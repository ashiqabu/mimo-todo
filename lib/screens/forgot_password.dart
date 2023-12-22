import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/core/constant.dart';
import 'package:todo_list/screens/create_Account.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailTextCntrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  Text(
                    'Reset Password',
                    style: GoogleFonts.gafata(fontSize: 30),
                  ),
                ],
              ),
            ),
            kHeight(50),
            TextFormField(
              controller: emailTextCntrl,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 197, 203, 197),
                    fontWeight: FontWeight.bold),
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
            ),
            kHeight(10),
            const Text(
              'Enter the email address you used to create your account and we will email you a link to reset your password.',
              textAlign: TextAlign.center,
            ),
            kHeight(16),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance
                    .sendPasswordResetEmail(email: emailTextCntrl.text)
                    .then((value) => Navigator.of(context).pop());
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 41, 118, 181)),
                minimumSize: MaterialStateProperty.all(const Size(350, 60)),
                maximumSize: MaterialStateProperty.all(const Size(350, 60)),
              ),
              child: const Text('Reset'),
            ),
            kHeight(16),
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account? ',
                style: const TextStyle(fontSize: 13, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Register',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CreateAccount()));
                      },
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
