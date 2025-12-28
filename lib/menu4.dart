import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class Menu4 extends StatefulWidget {
  const Menu4({super.key});

  @override
  State<Menu4> createState() => _Menu4State();
}

class _Menu4State extends State<Menu4> {
  int antrian = 0;
  String kodeRegistrasi = '';
  String _qrData = '';

  void _generateNext() {
    setState(() {
      antrian += 1;
      final int angka = 100000 + antrian;
      kodeRegistrasi = 'PLU$angka';
      _qrData = kodeRegistrasi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('QR Generator'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Tekan Generate untuk menambah antrian dan membuat kode registrasi',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: _generateNext,
                    child: const Text('Generate'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        antrian = 0;
                        kodeRegistrasi = '';
                        _qrData = '';
                      });
                    },
                    child: const Text('Reset'),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              Text(
                'Antrian saat ini: $antrian',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              if (kodeRegistrasi.isNotEmpty) ...[
                Text(
                  'Kode registrasi: $kodeRegistrasi',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                PrettyQr(
                  size: 220,
                  data: _qrData,
                  errorCorrectLevel: QrErrorCorrectLevel.M,
                  roundEdges: true,
                  elementColor: Colors.teal,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Kembali'),
                    ),
                  ],
                ),
              ] else ...[
                const SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kembali'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
