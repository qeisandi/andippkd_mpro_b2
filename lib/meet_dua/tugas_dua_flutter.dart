import 'package:flutter/material.dart';

class meetDua extends StatelessWidget {
  const meetDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Profile Lengkap',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage("assets/image/cat.jpg"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Andi Qeis',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            margin: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 182, 181, 177),
              border: Border.all(color: Colors.black, width: 3),
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
          Padding(padding: const EdgeInsets.all(10.0)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(padding: const EdgeInsets.all(10.0)),
                Icon(Icons.phone, size: 25),
                Spacer(),
                Text(
                  '0857-7789-9924',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 50,
                  color: Colors.brown,
                  child: Center(
                    child: Text(
                      'Postingan',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 50,
                  color: Colors.blueGrey,
                  child: Center(
                    child: Text(
                      'Followers',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            child: Padding(
              child: Text(
                'Nama saya Andi muhammad tsabit qeis,deskripsi deskripsi deskripsi deskripsi deskripsi deskripsi deskripsi deskripsi deskripsi deskripsi deskripsi deskripsi deskripsi deskripsi deskripsi deskripsi',
                style: TextStyle(fontSize: 20),
              ),
              padding: const EdgeInsets.all(12.0),
            ),
          ),
        ],
      ),
    );
  }
}
