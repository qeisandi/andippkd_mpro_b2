import 'package:flutter/material.dart';

class MeetEnam extends StatefulWidget {
  const MeetEnam({super.key});

  @override
  State<MeetEnam> createState() => _MeetEnamState();
}

class _MeetEnamState extends State<MeetEnam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.keyboard_arrow_left_sharp),
          ),
        ),
        title: Text('Login', style: TextStyle(fontFamily: 'Gilroy')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Text(
              'Welcome Back',
              style: TextStyle(fontFamily: 'Gilroy', fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Sign in to your account',
              style: TextStyle(fontSize: 14, color: Color(0xff888888)),
            ),
            SizedBox(height: 28),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff888888),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'enter username',
                      hintStyle: TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff888888),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'enter username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 134),
                          ),
                          Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffEA9459),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff283FB1),
                          padding: EdgeInsets.symmetric(
                            horizontal: 160,
                            vertical: 16,
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text.rich(
                        TextSpan(
                          text: 'Dont have an account?',
                          style: TextStyle(color: Colors.red),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(color: Color(0xffEA9459)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
