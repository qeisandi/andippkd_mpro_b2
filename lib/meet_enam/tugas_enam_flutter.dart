import 'package:flutter/material.dart';

class MeetEnam extends StatefulWidget {
  const MeetEnam({super.key});

  @override
  State<MeetEnam> createState() => _MeetEnamState();
}

class _MeetEnamState extends State<MeetEnam> {
  bool _hidden = true;
  bool _ikonHide = false;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    controller: emailC,
                    textInputAction: TextInputAction.next,
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
                    controller: passC,
                    textInputAction: TextInputAction.done,
                    obscureText: _hidden,
                    decoration: InputDecoration(
                      hintText: 'enter password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
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
                  // SizedBox(height: 16),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 122),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xffEA9459),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          print(
                            'LOGIN DENGAN : EMAIL (${emailC.text}) & PASS (${passC.text})',
                          );
                        },
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
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Dont have an account?',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff888888),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffEA9459),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Or Sign In With",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff888888),
                              ),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 16,
                              ),
                            ),
                            child: Row(
                              children: [
                                Image.asset('assets/image/Google.png'),
                                SizedBox(width: 20),
                                Text(
                                  'Google',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 24),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 16,
                              ),
                            ),
                            child: Row(
                              children: [
                                Image.asset("assets/image/Facebook.png"),
                                SizedBox(width: 20),
                                Text(
                                  'Facebook',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Dont have an account?',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff888888),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Join Us",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffEA9459),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
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
