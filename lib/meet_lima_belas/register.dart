import 'package:flutter/material.dart';

class TugasLimaBelas extends StatefulWidget {
  const TugasLimaBelas({super.key});

  @override
  State<TugasLimaBelas> createState() => _TugasLimaBelasState();
}

class _TugasLimaBelasState extends State<TugasLimaBelas> {
  bool _hidden = true;
  bool _ikonHide = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Register Account',
          style: TextStyle(fontFamily: 'Gilroy', fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          Text('Silahakan Register'),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle_rounded),
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.input),
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    prefixIcon: Icon(Icons.key),
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (_hidden == true) {
                          _hidden = false;
                        } else {
                          _hidden = true;
                        }
                        setState(() {
                          _ikonHide = !_ikonHide;
                        });
                      },
                      icon:
                          _ikonHide
                              ? Icon(Icons.visibility_outlined)
                              : Icon(Icons.visibility_off_outlined),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff283FB1),
                    padding: EdgeInsets.symmetric(
                      horizontal: 140,
                      vertical: 16,
                    ),
                  ),
                  onPressed: () {},

                  child: Text(
                    'Register',
                    style: TextStyle(fontFamily: 'Gilroy', color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
