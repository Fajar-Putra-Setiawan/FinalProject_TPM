import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_akhir_anime_app/MenuNavbar/list.dart';
import 'package:project_akhir_anime_app/login.dart';
import 'package:project_akhir_anime_app/register.dart';

import 'package:project_akhir_anime_app/model/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return RegisterPage();
                }));
              },
              child: Text('Register'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return UserList();
                }));
              },
              child: Text('List'),
            ),
          ],
        ),
      ),
    );
  }
}