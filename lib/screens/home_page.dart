import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Row(
                  children: [
                    Icon(Icons.local_pharmacy,
                        color: Color(0xFF22C55E)),
                    SizedBox(width: 8),
                    Text(
                      "Apotek Sehat",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.person_outline),
              ],
            ),

            const SizedBox(height: 20),

            /// SEARCH
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                  hintText: "Cari obat atau suplemen...",
                ),
              ),
            ),

            const SizedBox(height: 25),

            /// GRID
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.75,
              children: [
                ProductCard(
                  name: "Paracetamol 500mg",
                  price: "Rp 8.500",
                  status: "Tersedia",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DetailPage()));
                  },
                ),
                const ProductCard(
                  name: "Multivitamin C",
                  price: "Rp 45.000",
                  status: "Habis",
                ),
                const ProductCard(
                  name: "Amoxicillin 500mg",
                  price: "Rp 25.000",
                  status: "Tersedia",
                ),
                const ProductCard(
                  name: "Vitamin D3",
                  price: "Rp 35.000",
                  status: "Tersedia",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/// ===============================
/// PRODUCT CARD
/// ===============================

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String status;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.status,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isAvailable = status == "Tersedia";

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(price,
                  style: const TextStyle(
                      color: Color(0xFF22C55E))),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(status,
                  style: TextStyle(
                      fontSize: 12,
                      color: isAvailable
                          ? Colors.green
                          : Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}