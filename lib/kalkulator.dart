import 'package:flutter/material.dart';

class Kalkulator extends StatefulWidget {
  const Kalkulator({super.key});

  @override
  State<Kalkulator> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  String _tampilAngka = "0";

  void _angkaBaru(String text) {
    setState(() {
      _tampilAngka = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Sederhana'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _tampilAngka,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ), 
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => _angkaBaru('1'), child: const Text('1')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () => _angkaBaru('2'), child: const Text('2')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () => _angkaBaru('3'), child: const Text('3')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => _angkaBaru('4'), child: const Text('4')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () => _angkaBaru('5'), child: const Text('5')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () => _angkaBaru('6'), child: const Text('6')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => _angkaBaru('7'), child: const Text('7')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () => _angkaBaru('8'), child: const Text('8')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: () => _angkaBaru('9'), child: const Text('9')),
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => _angkaBaru('0'), child: const Text('0')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
