import 'package:flutter/material.dart';
import 'package:plant_app/components/gsnackbar.dart';
import 'package:plant_app/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void _login(BuildContext context) async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      Map<String, String> data = {
        'email': email.text,
        'password': password.text
      };
      http.Response response = await AuthService().login(payload: data);
      Map<String, dynamic> responseMap = json.decode(response.body);

      if (!mounted) return;

      if (response.statusCode == 200) {
        Navigator.pushNamed(context, '/home');
      } else {
        GSnackbar.show(context, type: 'error', message: responseMap['message']);
        // print(responseMap['message']);
      }
    } else {
      GSnackbar.show(context, type: 'error', message: 'Fill-in login details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 50),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Login',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email Address',
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              controller: password,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                _login(context);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Does not have account?'),
              TextButton(
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  //registration screen
                  Navigator.pushNamed(context, '/register');
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
