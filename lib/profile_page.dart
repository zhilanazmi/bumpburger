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
            'Nama: Zhillan Azmi',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'NRP: 152022247',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
