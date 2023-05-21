import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project_akhir_anime_app/dashboard.dart';
import 'package:project_akhir_anime_app/MenuNavbar/list.dart';
import 'package:project_akhir_anime_app/login.dart';
import 'components/my_textfield.dart';
import 'model/user_model.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

TextEditingController _usernameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  late Box<User> userBox; //// Declare the userBox variable

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    openHiveBox(); // Call the method to open the box
  }

  Future<void> openHiveBox() async {
    await Hive.openBox<User>("users"); // Open the box
    userBox = Hive.box<User>("users"); // Assign the box to the variable
  }

  Future<void> _registerUser() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final userBox = Hive.box<User>('users');
    final existingUser = userBox.values.any(
      (user) => user.username == username,
    );

    if (existingUser == true) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Username Already Exists'),
          content: Text('Please choose a different username.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return null;
    }

    final hashedPassword = hashPassword(password);

    final newUser = User(username, hashedPassword);

    await userBox.add(newUser);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Registration Successful'),
        content: Text('You have been successfully registered.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  String hashPassword(String password) {
    final bytes = utf8.encode(password); // Convert password to bytes
    final digest = sha256.convert(bytes); // Hash the password using SHA-256
    return digest.toString(); // Return the hashed password as a string
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.mail_outline,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Glad you here!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 10),

                // username textfield
                MyTextField(
                  controller: _usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),
                const SizedBox(height: 20),

                // sign in button

                GestureDetector(
                  onTap: () {
                    _registerUser();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'List users ?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    RichText(
                        text: TextSpan(
                            text: 'Tap here',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const UserList();
                                }));
                              }))
                  ],
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Continue ?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    RichText(
                        text: TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginPage();
                                }));
                              }))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
