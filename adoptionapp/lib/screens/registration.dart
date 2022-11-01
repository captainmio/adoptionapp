import 'package:flutter/material.dart';
import 'package:plant_app/components/gsnackbar.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plant_app/services/auth_service.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  _register() async {
    if (fullname.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty) {
      // validate first if password and confirmPassword are the same
      if (password.text == confirmPassword.text) {
        Map<String, String> data = {
          'name': fullname.text,
          'email': email.text,
          'password': password.text,
        };

        http.Response response = await AuthService().register(payload: data);
        Map<String, dynamic> responseMap = json.decode(response.body);

        if (!mounted) return;

        if (response.statusCode == 200) {
          GSnackbar.show(context,
              type: 'error', message: "Successfully sign-up, Please login");
          Navigator.pushNamed(context, '/');
        } else {
          GSnackbar.show(context,
              type: 'error', message: responseMap['message']);
          // print(responseMap['message']);
        }
      } else {
        GSnackbar.show(context,
            type: 'error', message: 'Password and Confirm Password not match');
      }
    } else {
      GSnackbar.show(context,
          type: 'error', message: 'Please fill-up all fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        IconButton(
          alignment: Alignment.topLeft,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.blue,
        ),
        // const SizedBox(height: 50),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Registration',
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: fullname,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Full name',
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: email,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email address',
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: password,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: confirmPassword,
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Confirm Password',
            ),
          ),
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ElevatedButton(
            child: const Text('Signup'),
            onPressed: () {
              _register();
            },
          ),
        ),
      ],
    ));
  }
}
