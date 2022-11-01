import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Text('You are now in Home', style: TextStyle(fontSize: 30))
        ],
      ),
    );
  }
}
