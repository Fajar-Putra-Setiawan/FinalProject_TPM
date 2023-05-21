import 'package:flutter/material.dart';

class Fajar extends StatelessWidget {
  const Fajar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[400],
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 70.0,
              backgroundImage: AssetImage('assets/Photo.jpeg'),
            ),
            const Text(
              'Fajar Putra Setiawan',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '123200092',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 20,
                color: Colors.black45,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
            const Text(
              'IF-B',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 20,
                color: Colors.black45,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
            const SizedBox(
              height: 50.0,
              width: 200.0,
              child: Divider(
                color: Colors.white38,
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: const Icon(
                  Icons.call,
                  color: Colors.teal,
                ),
                title: Text(
                  '085869595349',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.mail,
                  color: Colors.teal.shade400,
                ),
                title: Text(
                  'fajar.putra1691@gmail.com',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
