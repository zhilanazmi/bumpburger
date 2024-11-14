import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';
import 'dashboard.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer untuk pindah ke halaman Dashboard setelah 5 detik
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Background warna biru
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animasi Lottie
            Lottie.asset(
              'assets/lottie_animations.json',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Burger Cashier App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Warna teks putih agar kontras dengan background
              ),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.jpg'), // Gambar profil
            ),
            SizedBox(height: 20),
            Text(
              'Nama: Zhillan Azmi',
              style: TextStyle(color: Colors.white), // Warna teks putih
            ),
            Text(
              'NRP: 152022247',
              style: TextStyle(color: Colors.white), // Warna teks putih
            ),
          ],
        ),
      ),
    );
  }
}
