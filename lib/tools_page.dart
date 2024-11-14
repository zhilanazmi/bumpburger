import 'package:flutter/material.dart';
import 'calculator_page.dart';
import 'currency_conversion_page.dart';

class ToolsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tools", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange, // Warna app bar yang menarik
      ),
      body: SafeArea( // Menggunakan SafeArea agar tidak terpotong dengan status bar
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Heading Section
              Text(
                "Pilih Alat yang Anda Butuhkan",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),

              // Kalkulator Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalculatorPage()), // Halaman Kalkulator
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  backgroundColor: Colors.blue, // Warna biru untuk tombol kalkulator
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Membulatkan sudut tombol
                  ),
                  elevation: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calculate, size: 30, color: Colors.white), // Ikon kalkulator
                    SizedBox(width: 10),
                    Text("Kalkulator", style: TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                ),
              ),

              SizedBox(height: 30), // Spasi antar tombol

              // Currency Conversion Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CurrencyConversionPage()), // Halaman konversi kurs
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  backgroundColor: Colors.green, // Warna hijau untuk tombol konversi kurs
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Membulatkan sudut tombol
                  ),
                  elevation: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.monetization_on, size: 30, color: Colors.white), // Ikon konversi kurs
                    SizedBox(width: 10),
                    Text("Konversi Kurs", style: TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
