import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MimoDemo extends StatelessWidget {
  const MimoDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Mimo Demo'),
      ),
      body: Center(
        child: Text(
          'mimo',
          style: GoogleFonts.gafata(fontSize: 50),
        ),
      ),
    );
  }
}
