import 'package:flutter/material.dart';

class MeetSatu extends StatelessWidget {
  const MeetSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
          255,
          36,
          55,
          150,
        ), // Changed color to indigoAccent
        title: Text("FLUTTER TES"), // Changed title to "Pertemuan 1"
        centerTitle: true, // Centered the title
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Action for search button
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('INI TAMPILAN AWAL'),
            Text('Nama Toko'),
            Text('Gambar 1'),
            Text('Gambar 2'),
            //Row(children: [Text('Gambar 1'), Text('Gambar 2')]),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(
        255,
        145,
        114,
        114,
      ), // Changed background color to white
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 134, 136, 151),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('INI TAMPILAN AWAL'),
              Text('Nama Toko'),
              Text('Gambar 1'),
              Text('Gambar 2'),
              Text('Gambar 3'),
              Text('Gambar 4'),
            ],
          ),
        ],
      ),
    );
  }
}
