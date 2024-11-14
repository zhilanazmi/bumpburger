import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
          SizedBox(height: 20),
          Text(
            'Nama: Nama Anda',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'NIM: 123456789',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
