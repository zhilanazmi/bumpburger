import 'package:flutter/material.dart';
import 'cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        // Jika keranjang kosong
        if (cartProvider.cartItems.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart, size: 100, color: Colors.grey),
                SizedBox(height: 20),
                Text('Keranjang Kosong', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('Tambahkan item dari menu untuk memulai pesanan Anda.',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ),
          );
        }

        // Menghitung total jumlah item dan total harga
        int totalItems = 0;
        double totalPrice = 0.0;

        for (var item in cartProvider.cartItems) {
          totalItems += item.quantity;
          totalPrice += item.totalPrice;
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartProvider.cartItems[index];
                  return Card(
                    elevation: 5, 
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), 
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(15),
                      title: Text(cartItem.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      subtitle: Text('Rp ${cartItem.price} x ${cartItem.quantity}', style: TextStyle(fontSize: 16)),
                      trailing: Text('Rp ${cartItem.totalPrice.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
                    ),
                  );
                },
              ),
            ),
            // Ringkasan total harga dan jumlah item
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Colors.black.withOpacity(0.1), thickness: 1),
                  SizedBox(height: 15),
                  Text('Total Item: $totalItems', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Total Harga: Rp ${totalPrice.toStringAsFixed(2)}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman checkout atau tindakan lainnya
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
                      backgroundColor: Colors.orange, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Lanjutkan ke Checkout'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
