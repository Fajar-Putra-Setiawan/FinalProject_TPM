import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../login.dart';

class KonversiWaktu extends StatefulWidget {
  const KonversiWaktu({Key? key}) : super(key: key);

  @override
  State<KonversiWaktu> createState() => _KonversiWaktuState();
}

class _KonversiWaktuState extends State<KonversiWaktu> {
  String dropdownValue = 'WIB';
  String _currentTime = '';
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "More",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.menu),
              style: const TextStyle(color: Colors.black),
              dropdownColor: Colors.grey,
              underline: Container(
                height: 2,
                color: Colors.black,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: const [
                DropdownMenuItem<String>(
                  value: 'WIB',
                  child: Text('WIB'),
                ),
                DropdownMenuItem<String>(
                  value: 'WITA',
                  child: Text('WITA'),
                ),
                DropdownMenuItem<String>(
                  value: 'WIT',
                  child: Text('WIT'),
                ),
                DropdownMenuItem<String>(
                  value: 'London',
                  child: Text('London'),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Waktu Saat Ini',
              style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.black,
                  fontSize: 20),
            ),
            Text(
              _currentTime,
              style: const TextStyle(
                fontSize: 25,
                fontFamily: 'Source Sans Pro',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 40),
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
    );
  }

  void _updateTime() {
    setState(() {
      if (dropdownValue == "WITA") {
        _currentTime = DateFormat('EEEE, dd MMMM yyyy, HH:mm:ss')
            .format(DateTime.now().add(const Duration(hours: 1)));
      } else if (dropdownValue == "WIT") {
        _currentTime = DateFormat('EEEE, dd MMMM yyyy, HH:mm:ss')
            .format(DateTime.now().add(const Duration(hours: 2)));
      } else if (dropdownValue == "London") {
        _currentTime =DateFormat('EEEE, dd MMMM yyyy, HH:mm:ss')
            .format(DateTime.now().add(const Duration(hours: 18)));
      } else {
        _currentTime =
            DateFormat('EEEE, dd MMMM yyyy, HH:mm:ss').format(DateTime.now());
      }
    });
    Future.delayed(Duration(seconds: 1)).then((_) => _updateTime());
  }
}
