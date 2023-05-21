import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_akhir_anime_app/MenuNavbar/list.dart';
import 'package:project_akhir_anime_app/components/my_button.dart';
import 'package:project_akhir_anime_app/components/my_textfield.dart';
import 'package:project_akhir_anime_app/components/square_tile.dart';
import 'package:project_akhir_anime_app/login.dart';
import 'package:project_akhir_anime_app/mainpage.dart';

class LogoutPage extends StatelessWidget {
  LogoutPage({Key? key}) : super(key: key);

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Settings',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red.shade900,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Bentuk pinggiran tombol
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
