import 'package:flutter/material.dart';

bool isPrime(int input) {
  // 1. Bedingung: Nur natürliche Zahlen {1, 2, 3, 4, 5, ...}!
  // 2, Bedingung: {0, 1} sind keine Primzahlen -> int mögliche Primzzahl > 1!
  // 2. Bedingung: nur durch 1 und durch sich selbst ohne Rest (also Modulo = 0) teilbar!
  if (input <= 1) {
    return false; // Ganze Zahlen kleiner gleich 1 sind keine Primzahlen
  }
  for (int i = 2; i * i <= input; i++) {
    if (input % i == 0) {
      return false; // input ist keine Primzahl, wenn es einen Teiler gibt, der kleiner oder gleich seiner Quadratwurzel ist
    }
  }
  return true; // Alle ganzen Zahlen, die übrig bleiben, sind Primzahlen
}

class S3382 extends StatefulWidget {
  const S3382({Key? key}) : super(key: key);

  @override
  State<S3382> createState() => _S3382State();
}

class _S3382State extends State<S3382> {
  final TextEditingController _inputController = TextEditingController();
  String? output;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _inputController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Zahl',
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          output?.toString() ?? '',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
          onPressed: () {
            final input = int.tryParse(_inputController.text);
            if (input == null) {
              setState(() {
                output = null;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Bitte eine Zahl eingeben.'),
                ),
              );
              return;
            }
            setState(() {
              output = isPrime(input) ? "Primzahl" : "Keine Primzahl";
            });
          },
          child: const Text('Prüfen'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }
}
