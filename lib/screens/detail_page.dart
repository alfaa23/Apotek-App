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
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [

            /// BAGIAN ATAS (GAMBAR + BACK)
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                  child: Center(
                    child: Image.network(
                      "https://via.placeholder.com/200",
                      height: 180,
                    ),
                  ),
                ),

                Positioned(
                  top: 10,
                  left: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                )
              ],
            ),

            /// CARD DETAIL
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// LABEL
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "ANALGESIK",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),

                    SizedBox(height: 15),

                    /// NAMA PRODUK
                    Text(
                      "Panadol Extra\n(Paracetamol & Kafein)",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20),

                    /// HARGA & STATUS
                    Row(
                      children: [

                        /// HARGA
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "HARGA PER STRIP",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Rp 15.000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(width: 10),

                        /// STATUS
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.circle,
                                    color: Colors.green, size: 10),
                                SizedBox(width: 5),
                                Text(
                                  "Tersedia",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    /// DESKRIPSI
                    Text(
                      "DESKRIPSI",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Panadol Extra memberikan pereda nyeri yang efektif untuk sakit kepala, migrain, dan sakit gigi. Formula khusus dengan tambahan kafein",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),

                    Spacer(),

                    /// BUTTON WA
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: openWA,
                        icon: Icon(Icons.chat),
                        label: Text(
                          "Pesan via WhatsApp",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}