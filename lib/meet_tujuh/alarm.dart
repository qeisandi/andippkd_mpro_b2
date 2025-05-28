import 'package:flutter/material.dart';

class TujuhE extends StatefulWidget {
  const TujuhE({super.key});

  @override
  State<TujuhE> createState() => _TujuhEState();
}

class _TujuhEState extends State<TujuhE> {
  TimeOfDay? _selectedTime;

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 7, minute: 30),
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 300),
            Text('Atur Pengingat', style: TextStyle(fontFamily: 'Gilroy')),
            IconButton(onPressed: _pickTime, icon: Icon(Icons.access_alarm)),
            // SizedBox(height: 12),
            Text(
              _selectedTime != null
                  ? "Pengingat diatur pukul: ${_selectedTime!.format(context)}"
                  : "Belum memilih waktu",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
