import 'package:flutter/material.dart';

class MeetEmpat extends StatefulWidget {
  const MeetEmpat({super.key});

  @override
  State<MeetEmpat> createState() => _MeetEmpatState();
}

class _MeetEmpatState extends State<MeetEmpat> {
  final TextEditingController _controllerNama = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff222831),
        title: Text(
          'Register',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            // margin: EdgeInsets.symmetric(vertical: 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Color(0xffDFD0B8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Username',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _controllerNama,
                  onChanged: (value) {
                    setState(() {
                      _controllerNama.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle_rounded),
                    hintText: 'enter username',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(12)),
                Row(
                  children: [
                    Text(
                      'Email address',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _controllerEmail,
                  onChanged: (value) {
                    setState(() {
                      _controllerEmail.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(12)),
                Row(
                  children: [
                    Text(
                      'Phone number',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                TextField(
                  controller: _controllerPhone,
                  onChanged: (value) {
                    setState(() {
                      _controllerPhone.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_android),
                    hintText: 'your number',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(25)),
                TextField(
                  maxLines: 5,
                  maxLength: 150,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.all(12),
            height: 100,
            width: 500,
            decoration: BoxDecoration(
              color: Color(0xffDFD0B8),
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama: ${_controllerNama.text}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Email: ${_controllerEmail.text}'),
                Text('Phone: ${_controllerPhone.text}'),
              ],
            ),
          ),
          Card(
            child: ListTile(
              leading: Image.asset('assets/image/samsung1.jpg'),
              title: Text('Samsung1'),
              subtitle: Text('1.000.000,00'),
            ),
          ),
        ],
      ),
    );
  }
}
