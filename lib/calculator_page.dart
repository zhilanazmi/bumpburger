import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _output = "0";  // Menyimpan hasil perhitungan

  // Daftar tombol kalkulator
  final List<String> _buttons = [
    '7', '8', '9', '/',
    '4', '5', '6', 'x',
    '1', '2', '3', '-',
    'C', '0', '=', '+',
  ];

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '0'; // Clear the output
      } else if (buttonText == '=') {
        _output = _calculateResult(_output); // Calculate the result
      } else {
        _output = _output == '0' ? buttonText : _output + buttonText; // Append text to output
      }
    });
  }

  String _calculateResult(String expression) {
    // Mengganti x menjadi * untuk operasi perkalian
    expression = expression.replaceAll('x', '*');
    expression = expression.replaceAll('/', '/');
    try {
      // Menggunakan package math_expressions untuk mengevaluasi ekspresi matematika
      Parser parser = Parser();
      Expression exp = parser.parse(expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm); // Evaluasi ekspresi
      return result.toString(); // Mengembalikan hasil perhitungan sebagai string
    } catch (e) {
      return 'Error'; // Jika terjadi kesalahan dalam perhitungan
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrangeAccent, // Warna appBar
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Output Display
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _output,
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              // GridView untuk tombol kalkulator
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // 4 kolom
                    crossAxisSpacing: 12, // Spasi horizontal antar tombol
                    mainAxisSpacing: 12, // Spasi vertikal antar tombol
                    childAspectRatio: 1.2, // Perbandingan ukuran tombol
                  ),
                  itemCount: _buttons.length,
                  itemBuilder: (context, index) {
                    String buttonText = _buttons[index];

                    return ElevatedButton(
                      onPressed: () => _onButtonPressed(buttonText),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonText == 'C'
                            ? Colors.redAccent // Tombol Clear dengan warna merah
                            : buttonText == '='
                                ? Colors.greenAccent // Tombol Equal dengan warna hijau
                                : Colors.orangeAccent, // Tombol lain dengan warna oranye
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Sudut melengkung
                        ),
                        padding: EdgeInsets.all(20),
                        elevation: 5, // Efek bayangan pada tombol
                      ),
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}