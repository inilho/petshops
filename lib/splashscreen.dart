import 'dart:async';

import 'package:flutter/material.dart';
import 'package:patshop/webviewpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3), // Ubah durasi sesuai kebutuhan Anda
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WebviewPage()), // Ganti dengan halaman utama aplikasi Anda
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ganti dengan warna latar belakang yang sesuai
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // Ganti dengan path logo Anda
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 16),
            const CircularProgressIndicator(), // Ubah dengan indikator loading yang sesuai
          ],
        ),
      ),
    );
  }
}