import 'package:andippkd_mpro_b2/meet_lima_belas/Helper/Api/api_2.dart';
import 'package:flutter/material.dart';

class RegisLimaBelas extends StatefulWidget {
  const RegisLimaBelas({super.key});

  @override
  State<RegisLimaBelas> createState() => _RegisLimaBelasState();
}

class _RegisLimaBelasState extends State<RegisLimaBelas> {
  final _formKey = GlobalKey<FormState>();
  final _namaLengkapController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hidden = true;
  bool _loading = false;
  final UserServis UerServis = UserServis();

  final primaryColor = Colors.deepOrange;
  final backgroundColor = Color(0xFFF5F5F5);
  final inputFillColor = Colors.white;
  final borderRadius = 30.0;

  void register() async {
    setState(() {
      _loading = true;
    });

    final res = await UserServis().regisUser(
      email: _emailController.text,
      name: _namaLengkapController.text,
      password: _passwordController.text,
    );

    if (res["data"] != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Berhasil Registrasi!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    } else if (res["errors"] != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Maaf, ${res["message"]}"),
          backgroundColor: Colors.red,
        ),
      );
    }

    setState(() {
      _loading = false;
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
          'Daftar Akun',
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
                'Buat akun baru untuk mulai',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 24),
              _buildInputField(
                'Nama Lengkap',
                Icons.badge,
                _namaLengkapController,
              ),
              SizedBox(height: 16),
              _buildInputField(
                'Email',
                Icons.email,
                _emailController,
                inputType: TextInputType.emailAddress,
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print('Email: ${_emailController.text}');
                    print('Nama: ${_namaLengkapController.text}');
                    print('Password: ${_passwordController.text}');
                    register();
                  }
                },
                child:
                    _loading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                          'Register',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: Colors.white,
                          ),
                        ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: Text(
                  'Sudah punya akun? Masuk di sini',
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
    TextEditingController controller, {
    TextInputType inputType = TextInputType.text,
  }) {
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
