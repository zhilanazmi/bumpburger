import 'package:flutter/material.dart';
import 'burger_menu.dart';
import 'order_page.dart';
import 'profile_page.dart';
import 'cart_page.dart';

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
        title: Text('Dashboard Kasir Burger'),
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
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Halaman yang menampilkan daftar menu burger di Dashboard
class BurgerMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: burgerMenus.length,
        itemBuilder: (context, index) {
          final burger = burgerMenus[index];
          return Card(
            child: ListTile(
              leading: Image.asset(burger.image, width: 60, height: 60, fit: BoxFit.cover),
              title: Text(burger.name),
              subtitle: Text('Rp ${burger.price}'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderPage(burger: burger)),
                  );
                },
                child: Text('Pesan'),
              ),
            ),
          );
        },
      ),
    );
  }
}
