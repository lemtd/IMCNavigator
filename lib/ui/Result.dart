import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  String? image;
  String? text;

  Result(this.image, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title:
        const Text(
          "Results",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image!,
            fit: BoxFit.cover,
            height: 300,
          ),
          Center(
            child: Text(
              text!,
              style: const TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
