import 'package:flutter/material.dart';

class MyCal extends StatefulWidget {
  const MyCal({super.key});

  @override
  State<MyCal> createState() => _MyCalState();
}

class _MyCalState extends State<MyCal> {
  String text_display = "0";
  String cals = "";
  String cals1 = "";
  double hitung1 = 0;
  double hitung2 = 0;
  String operator_mat = "";

  void hitung_cal(String cal) {
    setState(() {
      if (cal == "C") {
        text_display = "0";
        cals = "";
        cals1 = "";
        operator_mat = "";
        hitung1 = 0;
        hitung2 = 0;
      } else if (cal == "+" || cal == "-" || cal == "x" || cal == "/") {
        if (cals.isNotEmpty) {
          operator_mat = cal;
          text_display = cals + operator_mat;
        }
      } else if (cal == "=") {
        if (cals.isNotEmpty && cals1.isNotEmpty && operator_mat.isNotEmpty) {
          hitung1 = double.parse(cals);
          hitung2 = double.parse(cals1);

          double result = 0;
          if (operator_mat == "+") {
            result = hitung1 + hitung2;
          } else if (operator_mat == "-") {
            result = hitung1 - hitung2;
          } else if (operator_mat == "x") {
            result = hitung1 * hitung2;
          } else if (operator_mat == "/") {
            result = hitung1 / hitung2;
          }

          // Format result to remove trailing .0
          String resultString = result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 2);
          
          text_display = resultString;
          cals = resultString;
          cals1 = "";
          operator_mat = "";
        }
      } else {
        if (operator_mat.isEmpty) {
          cals += cal;
          text_display = cals;
        } else {
          cals1 += cal;
          text_display = cals + operator_mat + cals1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Kalkulator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text_display,
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  hitung_cal("C");
                },
                child: const Text(
                  'C',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  hitung_cal("x");
                },
                child: const Text(
                  'x',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  hitung_cal("/");
                },
                child: const Text(
                  '/',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  hitung_cal("=");
                },
                child: const Text(
                  '=',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  hitung_cal("7");
                },
                child: const Text(
                  '7',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  hitung_cal("8");
                },
                child: const Text(
                  '8',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  hitung_cal("9");
                },
                child: const Text(
                  '9',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  hitung_cal("-");
                },
                child: const Text(
                  '-',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  hitung_cal("4");
                },
                child: const Text(
                  '4',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  hitung_cal("5");
                },
                child: const Text(
                  '5',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  hitung_cal("6");
                },
                child: const Text(
                  '6',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  hitung_cal("+");
                },
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  hitung_cal("1");
                },
                child: const Text(
                  '1',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  hitung_cal("2");
                },
                child: const Text(
                  '2',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  hitung_cal("3");
                },
                child: const Text(
                  '3',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  hitung_cal("0");
                },
                child: const Text(
                  '0',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
