import 'package:flutter/material.dart';

class UnderMaintenance extends StatelessWidget {
  const UnderMaintenance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF316B48), // #316B48 color
        title: const Text('Under Maintenance'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.settings,
            //   size: 100,
            //   color: Color(0xFF316B48), // #316B48 color
            // ),

            Image(
              image: AssetImage(
                'assets/tteok.png',
              ),
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Under Maintenance',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF316B48), // #316B48 color
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Please kindly wait until the maintenance process is completed. Thank You!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF316B48), // #316B48 color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
