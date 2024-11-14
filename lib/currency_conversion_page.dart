import 'package:flutter/material.dart';

class CurrencyConversionPage extends StatefulWidget {
  @override
  _CurrencyConversionPageState createState() =>
      _CurrencyConversionPageState();
}

class _CurrencyConversionPageState extends State<CurrencyConversionPage> {
  final TextEditingController _amountController = TextEditingController();
  String _fromCurrency = 'USD';
  String _toCurrency = 'IDR';
  double _convertedAmount = 0.0;
  List<String> _currencies = ['USD', 'IDR', 'EUR', 'JPY', 'GBP', 'AUD'];

  void _convertCurrency() {
    double amount = double.tryParse(_amountController.text) ?? 0.0;
    if (amount == 0.0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Masukkan jumlah uang yang valid untuk konversi!')));
      return;
    }

    // Simulasi konversi (menggunakan rate yang dipilih)
    double conversionRate = 1.0; // Nilai default
    if (_fromCurrency == 'USD' && _toCurrency == 'IDR') {
      conversionRate = 15000; // 1 USD = 15,000 IDR
    } else if (_fromCurrency == 'USD' && _toCurrency == 'EUR') {
      conversionRate = 0.85; // 1 USD = 0.85 EUR
    } else if (_fromCurrency == 'IDR' && _toCurrency == 'USD') {
      conversionRate = 0.000067; // 1 IDR = 0.000067 USD
    }
    // Tambahkan konversi lain sesuai kebutuhan

    setState(() {
      _convertedAmount = amount * conversionRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Kurs', style: TextStyle(fontSize: 24)),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input jumlah uang
              Text(
                'Masukkan Jumlah Uang',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Jumlah',
                  hintText: 'Masukkan jumlah uang',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.05),
                ),
              ),
              SizedBox(height: 20),
              
              // Dropdown untuk memilih mata uang asal
              Text(
                'Pilih Mata Uang Asal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orange, width: 2),
                ),
                child: DropdownButton<String>(
                  value: _fromCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      _fromCurrency = newValue!;
                    });
                  },
                  items: _currencies
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  isExpanded: true,
                  style: TextStyle(fontSize: 16, color: Colors.black),  // Warna teks di dropdown
                  underline: SizedBox(), // Hapus garis bawah default
                  dropdownColor: Colors.white,  // Warna latar belakang dropdown
                ),
              ),
              SizedBox(height: 20),

              // Dropdown untuk memilih mata uang tujuan
              Text(
                'Pilih Mata Uang Tujuan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.orange, width: 2),
                ),
                child: DropdownButton<String>(
                  value: _toCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      _toCurrency = newValue!;
                    });
                  },
                  items: _currencies
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  isExpanded: true,
                  style: TextStyle(fontSize: 16, color: Colors.black),  // Warna teks di dropdown
                  underline: SizedBox(), // Hapus garis bawah default
                  dropdownColor: Colors.white,  // Warna latar belakang dropdown
                ),
              ),
              SizedBox(height: 20),

              // Tombol untuk mengonversi
              Center(
                child: ElevatedButton(
                  onPressed: _convertCurrency,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Konversi',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Menampilkan hasil konversi
              if (_convertedAmount > 0)
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Hasil Konversi',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '$_convertedAmount $_toCurrency',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
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
