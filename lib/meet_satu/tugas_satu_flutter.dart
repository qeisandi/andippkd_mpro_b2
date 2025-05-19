import 'package:flutter/material.dart';

class Tugas1 extends StatelessWidget {
  const Tugas1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.account_circle_outlined,
            color: Colors.deepOrange,
            size: 90,
          ),
          Text('Nama : Andi', style: TextStyle(fontSize: 25)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.red),
              Text('Jakarta', style: TextStyle(fontSize: 20)),
            ],
          ),
          Text('Seorang pelajar yang sedang belajar Flutter.'),
        ],
      ),
    );
  }
}
