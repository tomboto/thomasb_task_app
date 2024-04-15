import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

/// This functions tries to hack a 4 digit PIN.
/// It returns the PIN as a string.
String hackPin() {
  List<String> digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

  String pinTrial = "";

  // Durchlaufe alle möglichen Kombinationen von 4-stelligen PINs
  for (String firstDigit in digits) {
    for (String secondDigit in digits) {
      for (String thirdDigit in digits) {
        for (String fourthDigit in digits) {
          pinTrial = firstDigit + secondDigit + thirdDigit + fourthDigit;
          // PIN auf ihre Korrektheit überprüfen
          if (_isPinCorrect(pinTrial)) {
            return pinTrial;
          }
        }
      }
    }
  }

  // Falls keine korrekte PIN gefunden wurde
  return pinTrial;
}

// ignore: unused_element
bool _isPinCorrect(String input) {
  final hashedInput = sha1.convert(utf8.encode(input)).toString();
  return hashedInput == _secretPinHashed;
}

const String _secretPinHashed = '2a0ebfb7c7ecc618493f4f6dfae77d2bccddc7ba';

class S3387 extends StatefulWidget {
  const S3387({Key? key}) : super(key: key);

  @override
  State<S3387> createState() => _S3387State();
}

class _S3387State extends State<S3387> {
  String? output;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          output?.toString() ?? '',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 32,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              output = "Die PIN lautet: ${hackPin()}.";
            });
          },
          child: const Text('Hacke PIN'),
        ),
      ],
    );
  }
}
