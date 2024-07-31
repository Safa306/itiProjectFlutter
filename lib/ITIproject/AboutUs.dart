import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.brown
        ),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Developed by: Safaa Magdy ",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,

        ),
        ),

      ),);
  }
}
