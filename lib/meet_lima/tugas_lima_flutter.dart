import 'package:flutter/material.dart';

class MeetLima extends StatefulWidget {
  const MeetLima({super.key});

  @override
  State<MeetLima> createState() => _MeetLimaState();
}

class _MeetLimaState extends State<MeetLima> {
  bool _showName = false;
  bool _ikonFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Meet5A',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0xff096B68),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff90D1CA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _showName = !_showName;
                    });
                  },
                  child: Text(_showName ? "sembunykan nama" : "tampilkan nama"),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          if (_showName)
            Text(
              "Nama saya : Andi",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.favorite, color: Colors.red, Colors.grey),
                onPressed: () {
                  setState(() {
                    _ikonFav = !_ikonFav;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
