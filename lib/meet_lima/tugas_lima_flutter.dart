import 'package:flutter/material.dart';

class MeetLima extends StatefulWidget {
  const MeetLima({super.key});

  @override
  State<MeetLima> createState() => _MeetLimaState();
}

class _MeetLimaState extends State<MeetLima> {
  bool _showName = false;
  bool _ikonFav = false;
  bool _readMore = false;
  int _nilaiTambah = 0;
  bool _isClick = false;
  bool _sentuh = false;
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
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 95),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _ikonFav = !_ikonFav;
                      });
                    },
                    icon: Icon(
                      color: _ikonFav ? Colors.red : Colors.grey,
                      Icons.favorite,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (_ikonFav) Text('Like'),
          Column(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _readMore = !_readMore;
                  });
                },
                child: Text('Read More'),
              ),
            ],
          ),
          if (_readMore)
            Text(
              'Selamat datang di salah satu pusat pelatihan daerah jakarta pusat',
              textAlign: TextAlign.center,
            ),
          SizedBox(height: 15),
          // Text(
          //   '$_nilaiTambah',
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          // ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _isClick = !_isClick;
                    print('Kotak disentuh');
                  });
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/image/meme.jpg',
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                    // Container(
                    // color: Color(0xff90D1CA),
                    // child: Center(child: Text('Ayo pukul aku')),
                    // ),
                    Text(
                      _isClick ? "" : "Aww sakitt...",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(horizontal: 50)),
                        Text(
                          'Total Count: $_nilaiTambah',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              setState(() {
                _sentuh = !_sentuh;
                print('Di tekan sekali');
              });
            },
            onDoubleTap: () {
              setState(() {
                _sentuh = !_sentuh;
                print('Di tekan Dua kali');
              });
            },
            onLongPress: () {
              setState(() {
                _sentuh = !_sentuh;
                print('Di tekan Lama');
              });
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff90D1CA),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  height: 50,
                  width: 300,
                  child: Center(child: Text('tekan saya')),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_nilaiTambah >= 50) {
              _nilaiTambah = 0;
            } else {
              _nilaiTambah++;
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
