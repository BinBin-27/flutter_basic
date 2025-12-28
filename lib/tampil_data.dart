import "dart:convert";
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Widget utama yang menjalankan aplikasi
class TampilData extends StatelessWidget {
  const TampilData({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductPage(), // Halaman utama aplikasi
    );
  }
}

// Halaman untuk menampilkan daftar produk
class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<dynamic> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts(); // Memuat data produk saat halaman dibuka
  }

  // Fungsi untuk mengambil data dari API
  Future<void> fetchProducts() async {
    const String apiUrl = "https://dummyjson.com/products";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          products = jsonData['products'];
          isLoading = false; // Selesai memuat
        });
      } else {
        throw Exception('Gagal memuat produk');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')), // Judul AppBar
      // Menampilkan loading atau GridView berdasarkan status `isLoading`
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            ) // Tampilkan loading
          : GridView.builder(
              padding: const EdgeInsets.all(8.0), // Padding untuk grid
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 kolom
                crossAxisSpacing: 8.0, // Jarak antar item horizontal
                mainAxisSpacing: 8.0, // Jarak antar item vertikal
              ),
              itemCount: products.length, // Jumlah item dalam grid
              itemBuilder: (context, index) {
                final product = products[index];
                final imageUrl = product['thumbnail'] as String? ?? '';

                // Widget GridTile yang lebih sederhana
                return GridTile(
                  footer: GridTileBar(
                    backgroundColor: Colors.black54,
                    title: Text(
                      product['title'] ?? 'Tanpa Judul',
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text('\$${product['price'] ?? '0'}'),
                  ),
                  child: imageUrl.isNotEmpty
                      ? Image.network(
                          imageUrl,
                          fit: BoxFit.cover, // Gambar memenuhi tile
                          errorBuilder: (context, error, stackTrace) {
                            // Tampilan jika gambar gagal dimuat
                            return const Center(
                              child: Icon(Icons.broken_image),
                            );
                          },
                        )
                      : const Center(child: Icon(Icons.image_not_supported)),
                );
              },
            ),
    );
  }
}
