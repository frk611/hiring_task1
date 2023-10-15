import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        //title: const Text('to visit login page again', style: TextStyle(fontSize: 10),),
      ),
      body: const SafeArea(
        child: Center( 
          child: Center(
            child: SingleChildScrollView(
              child: Text("Welcome to the HomePage!", style: TextStyle(fontSize: 20)),
           ),
         ),
        ),
      ),
    );
  }
}