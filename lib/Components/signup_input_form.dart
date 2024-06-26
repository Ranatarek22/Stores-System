import 'package:assignment1/Screens/profile_screen.dart';
import 'package:assignment1/Services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Screens/stores_screen.dart';
import 'custom_text_field.dart';
import 'level_list.dart';
import 'gender_radio_button.dart';
import 'package:assignment1/Model/users.dart';
import 'package:assignment1/Services/sql_db.dart';

//
class SignupInputForm extends StatefulWidget {
  const SignupInputForm({Key? key});

  @override
  State<SignupInputForm> createState() => _SignupInputFormState();
}

class _SignupInputFormState extends State<SignupInputForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _studentIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  late UserData user;
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  String? name, email, studentId, password, confirmPassword, level, gender;

  Future<void> _saveUserToDatabase(BuildContext context) async {
    user = UserData(
      name: _nameController.text,
      email: _emailController.text,
      studentId: _studentIDController.text,
      password: _passwordController.text,
      level: level,
      gender: gender,
    );

    int result = await _databaseHelper.insertUser(user.toMap());
    UserData? data = await _databaseHelper.getUser(_emailController.text);
    if (data == null) {
      return;
    }
    if (result == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'This email is already in use. Please use a different email.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => StoresScreen(
            userId: data.id!,
            userData: data,
          ),
        ),
      );
    }
  }

  // Future<void> _signup(BuildContext context) async {
  //   final baseUrl = 'https://nexus-api-h3ik.onrender.com';
  //   final endpoint = '/api/auth/signup';
  //
  //   final url = Uri.parse('$baseUrl$endpoint');
  //
  //   final Map<String, String> headers = {
  //     'Content-Type': 'application/json',
  //   };
  //
  //   final UserData user = UserData(
  //     name: _nameController.text,
  //     email: _emailController.text,
  //     studentId: _studentIDController.text,
  //     password: _passwordController.text,
  //     level: level,
  //     gender: gender,
  //   );
  //
  //   int result = await _databaseHelper.insertUser(user.toMap());
  //   if (result == -1) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(
  //             'This email is already in use. Please use a different email.'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //     return;
  //   }
  //
  //   final response = await http.post(
  //     url,
  //     headers: headers,
  //     body: jsonEncode(user.toMap()),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     print('Signup successful');
  //     print('Response: ${response.body}');
  //   } else {
  //     print('Signup failed');
  //     print('Error: ${response.body}');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Signup failed. Please try again.'),
  //         backgroundColor: Colors.grey,
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: _nameController,
            hintText: "Enter your name",
            labelText: 'Full Name',
            icon: Icons.person,
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          CustomTextField(
            controller: _emailController,
            hintText: "Enter your FCI email",
            labelText: 'Email',
            icon: Icons.email,
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r"^\d{8}@stud\.fci-cu\.edu\.eg$").hasMatch(value)) {
                return 'Please enter a FCI email';
              }
              return null;
            },
          ),
          CustomTextField(
            controller: _studentIDController,
            hintText: "Enter your ID",
            labelText: 'Student ID',
            icon: Icons.card_membership,
            onChanged: (value) {
              setState(() {
                studentId = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your student ID';
              }
              return null;
            },
          ),
          CustomTextField(
            controller: _passwordController,
            hintText: "Enter password (at least 8 characters)",
            labelText: 'Password',
            icon: Icons.lock,
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters long';
              }
              return null;
            },
          ),
          CustomTextField(
            controller: _confirmPasswordController,
            hintText: "Re-enter password",
            labelText: 'Confirm Password',
            icon: Icons.lock,
            onChanged: (value) {
              setState(() {
                confirmPassword = value;
              });
            },
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please re-enter your password';
              }
              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          LevelList(
            onChanged: (value) {
              setState(() {
                level = value;
              });
            },
          ),
          GenderRadioButton(
            onChanged: (value) {
              setState(() {
                gender = value;
              });
            },
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _saveUserToDatabase(context);
                  AuthService().signUpWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                      name: _nameController.text,
                      studentId: _studentIDController.text,
                      level: level,
                      gender: gender);
                }
              },
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10),
                backgroundColor: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _studentIDController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
