import 'package:flutter/material.dart';

class MeetTujuh extends StatefulWidget {
  const MeetTujuh({super.key});

  @override
  State<MeetTujuh> createState() => _MeetTujuhState();
}

class _MeetTujuhState extends State<MeetTujuh> {
  // final bool _isCheckedA = false;
  bool _valueCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'TugasTujuh',
            style: TextStyle(fontFamily: 'Gilroy', fontSize: 32),
          ),
        ),
      ),
      drawer: Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              // fillColor: WidgetStateProperty.all(AppColor.army1),
              activeColor: Colors.green,
              checkColor: Colors.white,
              shape: CircleBorder(),
              side: BorderSide(color: Colors.greenAccent, width: 3),
              value: _valueCheck,
              onChanged: (value) {
                setState(() {
                  print("Checkbox value changed: $value");
                  _valueCheck = value ?? false;
                });
              },
            ),
            Text(
              _valueCheck ? "Sudah bagus" : "Belum bagus",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
