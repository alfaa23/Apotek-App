import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  final String phone = "628123456789";

  void openWA() async {
    final url = Uri.parse(
        "https://wa.me/$phone?text=Saya ingin memesan produk ini");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back),
              ),

              Center(
                child: Image.network(
                  "https://via.placeholder.com/200",
                ),
              ),

              SizedBox(height: 20),

              Text(
                "Panadol Extra",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "Rp 15.000",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                ),
              ),

              Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: openWA,
                  icon: Icon(Icons.chat), // hanya ini yang diganti
                  label: Text("Pesan via WhatsApp"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}