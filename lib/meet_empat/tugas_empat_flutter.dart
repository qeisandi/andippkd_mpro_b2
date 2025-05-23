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
            margin: EdgeInsets.all(12),
            // margin: EdgeInsets.symmetric(vertical: 50),
            decoration: BoxDecoration(
              color: Color(0xffDFD0B8),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Username',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff393E46),
                      ),
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
                    prefixIcon: Icon(
                      Icons.account_circle_rounded,
                      color: Color(0xff222831),
                    ),
                    hintText: 'enter username',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Row(
                  children: [
                    Text(
                      'Email address',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff393E46),
                      ),
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
                    prefixIcon: Icon(Icons.email, color: Color(0xff222831)),
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Row(
                  children: [
                    Text(
                      'Phone number',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff393E46),
                      ),
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
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: Color(0xff222831),
                    ),
                    hintText: 'your number',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(12)),
                TextField(
                  maxLines: 3,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    color: Color(0xff393E46),
                  ),
                  child: Text(
                    'Register Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(12),
              height: 100,
              width: 500,
              decoration: BoxDecoration(
                color: Color(0xffDFD0B8),
                borderRadius: BorderRadius.all(Radius.circular(12)),
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
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Shopping cart',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Card(
                  child: ListTile(
                    trailing: Icon(Icons.add),
                    leading: Image.asset('assets/image/samsung1.jpg'),
                    title: Text(
                      'Samsung A15 5G',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text('Rp3.599.000'),
                  ),
                ),
                Card(
                  child: ListTile(
                    trailing: Icon(Icons.add),
                    leading: Image.asset('assets/image/samsung2.jpg'),
                    title: Text(
                      'Galaxy S24 Ultra',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text('Rp19.599.000'),
                  ),
                ),
                Card(
                  child: ListTile(
                    trailing: Icon(Icons.add),
                    leading: Image.asset('assets/image/samsung3.jpg'),
                    title: Text(
                      'Galaxy S22',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text('Rp6.879.000'),
                  ),
                ),
                Card(
                  child: ListTile(
                    trailing: Icon(Icons.add),
                    leading: Image.asset('assets/image/samsung4.jpg'),
                    title: Text(
                      'S21 Ultra',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text('Rp14.738.500'),
                  ),
                ),
                Card(
                  child: ListTile(
                    trailing: Icon(Icons.add),
                    leading: Image.asset('assets/image/samsung5.jpg'),
                    title: Text(
                      'S24 Ultra',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text('Rp 19.499.000'),
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
