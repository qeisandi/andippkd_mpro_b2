import 'package:flutter/material.dart';

class MeetDua extends StatelessWidget {
  const MeetDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          CircleAvatar(
            radius: 85,
            backgroundColor: Colors.lightGreen,
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("assets/image/cat.jpg"),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Andi Qeis',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            margin: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 199, 196, 196),
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(width: 8),
                    Text(
                      'Qeis.andi02@gmail.com',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              margin: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 199, 196, 196),
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              child: Row(
                children: [
                  Padding(padding: const EdgeInsets.all(0)),
                  Icon(
                    Icons.phone,
                    size: 25,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  Spacer(),
                  Text(
                    '0857-7789-9924',
                    style: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Center(
                    child: Text(
                      'Postingan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Center(
                    child: Text(
                      'Followers',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.green,
                    ),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages....',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Text(
                    'Read more',
                    style: TextStyle(color: Colors.blue),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Color.fromARGB(255, 41, 56, 68),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(padding: const EdgeInsets.all(10.0)),
                      Icon(Icons.copyright, size: 10, color: Colors.white),
                      Text(
                        'copyright 2025',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(padding: const EdgeInsets.all(10.0)),
                      Text('By : Qeh', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
