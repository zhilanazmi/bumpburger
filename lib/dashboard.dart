import 'package:flutter/material.dart';
import 'burger_menu.dart';
import 'cart_page.dart';
import 'profile_page.dart';
import 'cart_item.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'tools_page.dart';
import 'calculator_page.dart';
import 'currency_conversion_page.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan di setiap tab
  static List<Widget> _pages = <Widget>[
    BurgerMenuPage(),
    CartPage(),
    ToolsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BumpBurger Menu'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.yellow], // Warna gradien
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.restaurant_menu),
      label: 'Menu',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Keranjang',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.build),
      label: 'Tools',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profil',
    ),
  ],
  currentIndex: _selectedIndex,
  selectedItemColor: Colors.orange, 
  unselectedItemColor: Colors.black, 
  backgroundColor: Colors.white, 
  onTap: _onItemTapped,
  type: BottomNavigationBarType.fixed, 
  selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
)
    );
  }
}

// Halaman yang menampilkan daftar menu burger di Dashboard
class BurgerMenuPage extends StatefulWidget {
  @override
  _BurgerMenuPageState createState() => _BurgerMenuPageState();
}

class _BurgerMenuPageState extends State<BurgerMenuPage> {
  // Map untuk menyimpan jumlah burger yang dipilih
  Map<int, int> burgerQuantities = {};

  // Menambahkan semua item ke keranjang
  void _addAllToCart() {
    // Iterasi setiap burger dan menambahkan yang quantity > 0 ke keranjang
    for (int i = 0; i < burgerMenus.length; i++) {
      int quantity = burgerQuantities[i] ?? 0;
      if (quantity > 0) {
        // Membuat CartItem untuk burger yang dipilih
        CartItem cartItem = CartItem(
          name: burgerMenus[i].name,
          price: burgerMenus[i].price,
          quantity: quantity,
        );
        // Menambahkan item ke keranjang menggunakan CartProvider
        Provider.of<CartProvider>(context, listen: false).addItem(cartItem);
      }
    }

    // Menampilkan SnackBar sebagai feedback ke pengguna
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Semua item yang dipilih berhasil ditambahkan ke keranjang!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: burgerMenus.length,
              itemBuilder: (context, index) {
                final burger = burgerMenus[index];
                int quantity = burgerQuantities[index] ?? 0; // Default quantity 0

                return Card(
                  child: ListTile(
                    leading: Image.asset(burger.image, width: 60, height: 60, fit: BoxFit.cover),
                    title: Text(burger.name),
                    subtitle: Text('Rp ${burger.price}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Tombol untuk mengurangi quantity
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (quantity > 0) {
                                burgerQuantities[index] = quantity - 1;
                              }
                            });
                          },
                        ),
                        // Tampilkan jumlah burger yang dipilih
                        Text('$quantity', style: TextStyle(fontSize: 18)),
                        // Tombol untuk menambah quantity
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              burgerQuantities[index] = quantity + 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Tombol untuk menambahkan semua item yang dipilih ke keranjang
          ElevatedButton(
            onPressed: _addAllToCart,
            child: Text('Tambahkan Semua ke Keranjang'),
          ),
        ],
      ),
    );
  }
}
class ToolsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalculatorPage()),
              );
            },
            child: Text("Kalkulator", style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CurrencyConversionPage()),
              );
            },
            child: Text("Konversi Kurs", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}