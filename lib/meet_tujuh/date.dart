import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class TujuhD extends StatefulWidget {
  const TujuhD({super.key});

  @override
  State<TujuhD> createState() => _TujuhDState();
}

class _TujuhDState extends State<TujuhD> {
  DateTime? _selectedDate;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeLocale();
  }

  Future<void> _initializeLocale() async {
    await initializeDateFormatting('id', null);
    setState(() {
      _isInitialized = true;
    });
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      // Menunggu inisialisasi lokal selesai
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final formatter = DateFormat('d MMMM yyyy', 'id');

    return Scaffold(
      body: Center(
        // padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 300),
            ElevatedButton(
              onPressed: _pickDate,
              child: Text("Pilih Tanggal Lahir"),
            ),
            SizedBox(height: 20),
            Text(
              _selectedDate != null
                  ? "Tanggal Lahir: ${formatter.format(_selectedDate!)}"
                  : "Belum memilih tanggal",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
