import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project_akhir_anime_app/MenuNavbar/home.dart';
import 'package:project_akhir_anime_app/MenuNavbar/kesanpesan.dart';
import 'package:project_akhir_anime_app/MenuNavbar/konversi_matauang.dart';
import 'package:project_akhir_anime_app/MenuNavbar/logout.dart';
import 'package:project_akhir_anime_app/MenuNavbar/profile.dart';
import 'package:project_akhir_anime_app/MenuNavbar/waktu.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({ Key? key }) : super(key: key);

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    const Fajar(),
    const KesanPesan(),
    KonversiMataUang(),
    KonversiWaktu()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            onTabChange: (index) => setState(() => currentIndex = index),
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.people,
                text: 'Profile',
              ),
              GButton(
                icon: Icons.note_outlined,
                text: 'Note',
              ),
              GButton(
                icon: Icons.gamepad_outlined,
                text: 'Game',
              ),
              GButton(
                icon: Icons.settings,
                text: 'settings',
                ),
            ],
          ),
        ),
      ),
    );
  }
}