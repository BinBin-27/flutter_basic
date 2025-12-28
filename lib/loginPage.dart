import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

String urlApi = 'https://dummyjson.com/auth/login';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // A key to identify and validate the form
  final _formKey = GlobalKey<FormState>();

  // Controllers to get the text from the fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> SaveToken(String val) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', val);
    print(pref.getString('token'));
  }

  Future<void> loginApi(BuildContext context) async {
    final response = await http.post(
      Uri.parse(urlApi),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: {
        'username': _usernameController.text.trim(),
        'password': _passwordController.text.trim(),
      },
    );

    print("STATUS: ${response.statusCode}");

    final decoded = jsonDecode(response.body);
    print("EMAIL: ${decoded['email']}");
    print("USERNAME: ${decoded['username']}");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString('username', data["username"]);
      await pref.setString('token', data["accessToken"]);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MainPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login gagal: ${response.statusCode}")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login dengan Validasi')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // Form widget to hold and validate the fields
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Silakan Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  // Validator checks if the field is empty
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username tidak boleh kosong';
                    }
                    return null; // Return null if the input is valid
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true, // Hides the password
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  // Validator checks for emptiness and length
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    if (value.length < 4) {
                      return 'Password minimal 4 karakter';
                    }
                    return null; // Return null if the input is valid
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => loginApi(context), // Call the login function on press
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
