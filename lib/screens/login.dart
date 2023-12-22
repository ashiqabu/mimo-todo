import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/core/constant.dart';
import 'package:todo_list/screens/create_account.dart';
import 'package:todo_list/screens/forgot_password.dart';
import 'package:todo_list/screens/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordTextCntrl = TextEditingController();
  TextEditingController emailTextCntrl = TextEditingController();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'mimo',
              style: GoogleFonts.gafata(fontSize: 50),
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
            kHeight(16),
            TextFormField(
              controller: passwordTextCntrl,
              obscureText: obscurePassword,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: Color.fromARGB(255, 197, 203, 197),
                  fontWeight: FontWeight.bold,
                ),
                labelText: 'Password',
                hintText: 'Enter your Password',
                border: const OutlineInputBorder(),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                  child: Icon(
                    obscurePassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            kHeight(3),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ForgotPassword()));
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ),
            kHeight(16),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: emailTextCntrl.text,
                        password: passwordTextCntrl.text)
                    .then((value) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                }).onError((error, stackTrace) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error: ${error.toString()}'),
                      duration: const Duration(
                          seconds: 5), // Set the duration as needed.
                    ),
                  );
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 41, 118, 181)),
                minimumSize: MaterialStateProperty.all(const Size(350, 60)),
                maximumSize: MaterialStateProperty.all(const Size(350, 60)),
              ),
              child: const Text('Continue'),
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
