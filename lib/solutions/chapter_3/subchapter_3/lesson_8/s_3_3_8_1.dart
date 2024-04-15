import 'package:flutter/material.dart';

int reverseNumber(int input) {
  // Lösung hier einfügen
  // input=1234
  int reverse = 0;
  while (input > 0) {
    // letzte Ziffer isolieren: 1234%10 = 4 -> 123%10 = 3 -> 12%10 = 2 -> 1%10 = 1
    int lastDigit = input % 10;
    // letzte Ziffer anhängen: (0*10)+4 = 4 -> (4*10)+3 = 43 -> (43*10)+2 = 423 -> (423*10)+1 = 4321
    reverse = (reverse * 10) + lastDigit;
    // letzte Zahl entfernen: 1234/10 = 123 -> 123/10 = 12 -> 12/10 = 1 -> 1/10 = 0 -> Schleifenende
    input = input ~/ 10;
  }
  return reverse;
}

class S3381 extends StatefulWidget {
  const S3381({Key? key}) : super(key: key);

  @override
  State<S3381> createState() => _S3381State();
}

class _S3381State extends State<S3381> {
  final TextEditingController _inputController = TextEditingController();
  int? output;

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
              output = reverseNumber(input);
            });
          },
          child: const Text('Umdrehen'),
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
