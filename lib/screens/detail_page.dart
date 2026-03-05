import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  void openWA() async {
    final url = Uri.parse(
        "https://wa.me/628123456789?text=Saya ingin memesan Panadol Extra");

    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back)),

              Center(
                child: Container(
                  height: 150,
                  width: 200,
                  color: Colors.grey.shade200,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Panadol Extra\n(Paracetamol & Kafein)",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              const Text("Rp 15.000",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF22C55E))),

              const SizedBox(height: 10),

              const Text("Status Stok: Tersedia",
                  style: TextStyle(color: Colors.green)),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF22C55E),
                      padding:
                          const EdgeInsets.symmetric(
                              vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30),
                      )),
                  onPressed: openWA,
                  icon: const Icon(Icons.chat),
                  label: const Text(
                    "Pesan via WhatsApp",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}