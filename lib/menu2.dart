import 'dart:developer';
import 'package:flutter/material.dart';

class Menu2 extends StatefulWidget {
  const Menu2({super.key});

  @override
  State<Menu2> createState() => _Menu2State();
}

class _Menu2State extends State<Menu2> {
  int _jumlah = 0;

  void tambahAngka() {
    setState(() {
      _jumlah++;
    });
    log('Jumlah: $_jumlah');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('JUMLAH: $_jumlah', style: const TextStyle(fontSize: 34)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                tambahAngka();
              },
              child: const Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}
