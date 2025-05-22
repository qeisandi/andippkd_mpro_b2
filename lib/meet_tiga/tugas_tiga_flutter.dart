import 'package:flutter/material.dart';

class MeetTiga extends StatefulWidget {
  const MeetTiga({super.key});

  @override
  State<MeetTiga> createState() => _MeetTigaState();
}

class _MeetTigaState extends State<MeetTiga> {
  final TextEditingController _controllerNama = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff006A71),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              // margin: EdgeInsets.symmetric(vertical: 50),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Color(0xffF2EFE7),
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
                color: Color(0xffF2EFE7),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 300,
                child: GridView.count(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 3,
                  children: <Widget>[
                    Container(
                      color: Colors.black,
                      child: Stack(children: [buildStack()]),
                    ),
                    Container(
                      color: Colors.black,
                      child: Stack(children: [buildStack()]),
                    ),
                    Container(
                      color: Colors.black,
                      child: Stack(children: [buildStack()]),
                    ),
                    Container(
                      color: Colors.black,
                      child: Stack(children: [buildStack()]),
                    ),
                    Container(
                      color: Colors.black,
                      child: Stack(children: [buildStack()]),
                    ),
                    Container(
                      color: Colors.black,
                      child: Stack(children: [buildStack()]),
                    ),
                    Container(
                      color: Colors.black,
                      child: Stack(children: [buildStack()]),
                    ),
                    Container(
                      color: Colors.black,
                      child: Stack(children: [buildStack()]),
                    ),
                    Container(
                      color: Colors.black,
                      child: Stack(children: [buildStack()]),
                    ),
                    Container(
                      color: Colors.black,
                      child: Stack(children: [buildStack()]),
                    ),
                    Container(
                      color: Colors.black,
                      child: Stack(children: [buildStack()]),
                    ),
                    Container(
                      color: Colors.black,
                      child: Stack(children: [buildStack()]),
                    ),
                    Container(
                      color: Colors.black,
                      child: Stack(children: [buildStack()]),
                    ),
                    Container(
                      color: Colors.black,
                      child: Stack(children: [buildStack()]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Center buildStack() {
  return Center(
    child: Stack(
      alignment: Alignment.center,
      children: [Text('Hello:)', style: TextStyle(color: Colors.white))],
    ),
  );
}
