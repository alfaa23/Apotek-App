import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
            ),
            SizedBox(height: 15),
            Text("John Doe",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Text("+1234 567 890"),
          ],
        ),
      ),
    );
  }
}