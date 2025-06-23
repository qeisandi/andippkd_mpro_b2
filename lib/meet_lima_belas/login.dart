import 'package:andippkd_mpro_b2/meet_lima_belas/Helper/Api/api_2.dart';
import 'package:andippkd_mpro_b2/meet_lima_belas/Helper/shared/shred.dart';
import 'package:andippkd_mpro_b2/meet_lima_belas/dashboard.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hidden = true;
  final UserServis userServis = UserServis();
  bool isloading = false;

  final primaryColor = Colors.deepOrange;
  final backgroundColor = Color(0xFFF5F5F5);
  final inputFillColor = Colors.white;
  final borderRadius = 30.0;

  void login() async {
    setState(() {
      isloading = true;
    });

    final res = await UserServis().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    print("Respon dari API: $res");
    if (res["data"] != null) {
      final token = res['data']['token'];
      await SharedPref.saveToken(token);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Berhasil Registrasi!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushNamed(context, HomeScreen.id);
    } else if (res["errors"] != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Maaf, ${res["message"]}"),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Masuk Akun',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Selamat datang kembali!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 24),
              _buildInputField(
                'Email',
                Icons.email,
                _emailController,
                TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              _buildPasswordField(),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    print('Email: ${_emailController.text}');
                    print('Password: ${_passwordController.text}');
                    login();
                  }
                },
                child:
                    isloading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: Colors.white,
                          ),
                        ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text(
                  'Belum punya akun? Daftar di sini',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    IconData icon,
    TextEditingController controller,
    TextInputType inputType,
  ) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        filled: true,
        fillColor: inputFillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      validator: (value) => value!.isEmpty ? '$label tidak boleh kosong' : null,
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _hidden,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        labelText: 'Password',
        filled: true,
        fillColor: inputFillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        suffixIcon: IconButton(
          icon: Icon(_hidden ? Icons.visibility_off : Icons.visibility),
          onPressed: () => setState(() => _hidden = !_hidden),
        ),
      ),
      validator:
          (value) => value!.length < 6 ? 'Password minimal 6 karakter' : null,
    );
  }
}
