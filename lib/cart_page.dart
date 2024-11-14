import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart, size: 100, color: Colors.grey),
          SizedBox(height: 20),
          Text('Keranjang Kosong', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('Tambahkan item dari menu untuk memulai pesanan Anda.'),
        ],
      ),
    );
  }
}
