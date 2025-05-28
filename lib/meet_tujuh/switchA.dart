import 'package:flutter/material.dart';

class TujuhB extends StatefulWidget {
  const TujuhB({super.key});

  @override
  State<TujuhB> createState() => _TujuhBState();
}

class _TujuhBState extends State<TujuhB> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _darkMode ? Colors.grey : Colors.white,
      body: Center(
        // padding: EdgeInsets.all(40),
        child: Column(
          children: [
            SizedBox(height: 300),
            SwitchListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                "Aktifkan Mode Gelap",
                style: TextStyle(
                  color: _darkMode ? Colors.white : Colors.black,
                  fontFamily: 'Gilroy',
                ),
              ),
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
              },
            ),
            // SizedBox(height: 12),
            Row(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 12)),
                Text(
                  _darkMode ? "Mode Gelap Aktif" : "Mode Gelap Tidak Aktif",
                  style: TextStyle(
                    fontSize: 16,
                    color: _darkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
