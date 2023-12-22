import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/core/constant.dart';
import 'package:todo_list/screens/home.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController passwordTextCntrl = TextEditingController();
  TextEditingController emailTextCntrl = TextEditingController();
  TextEditingController userNameTextCntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
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
                        'Create an Account',
                        style: GoogleFonts.gafata(fontSize: 30),
                      ),
                    ],
                  ),
                ),
                kHeight(50),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: userNameTextCntrl,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 197, 203, 197),
                        fontWeight: FontWeight.bold),
                    hintText: 'Enter your Full Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                kHeight(16),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
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
                  keyboardType: TextInputType.name,
                  controller: passwordTextCntrl,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 197, 203, 197),
                        fontWeight: FontWeight.bold),
                    hintText: 'Enter your Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                kHeight(50),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailTextCntrl.text,
                            password: passwordTextCntrl.text)
                        .then((value) {
                      print('Log in successful');
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }).onError((error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error: ${error.toString()}'),
                          duration: const Duration(seconds: 5),
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
                    text: 'Already have an account? ',
                    style: const TextStyle(fontSize: 13, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'LogIn',
                        recognizer: TapGestureRecognizer()..onTap = () {},
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
        ),
      ),
    );
  }
}
