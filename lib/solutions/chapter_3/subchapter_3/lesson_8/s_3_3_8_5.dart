import 'package:flutter/material.dart';

bool isPalindrome(String input) {
  List<int> letterToNumber = [];
  for (int i = 0; i < input.length; i++) {
    switch (input[i]) {
      case "A":
      case "a":
        letterToNumber.add(1);
        break;
      case "B":
      case "b":
        letterToNumber.add(2);
        break;
      case "C":
      case "c":
        letterToNumber.add(3);
        break;
      case "D":
      case "d":
        letterToNumber.add(4);
        break;
      case "E":
      case "e":
        letterToNumber.add(5);
        break;
      case "F":
      case "f":
        letterToNumber.add(6);
        break;
      case "G":
      case "g":
        letterToNumber.add(7);
        break;
      case "H":
      case "h":
        letterToNumber.add(8);
        break;
      case "I":
      case "i":
        letterToNumber.add(9);
        break;
      case "J":
      case "j":
        letterToNumber.add(10);
        break;
      case "K":
      case "k":
        letterToNumber.add(11);
        break;
      case "L":
      case "l":
        letterToNumber.add(12);
        break;
      case "M":
      case "m":
        letterToNumber.add(13);
        break;
      case "N":
      case "n":
        letterToNumber.add(14);
        break;
      case "O":
      case "o":
        letterToNumber.add(15);
        break;
      case "P":
      case "p":
        letterToNumber.add(16);
        break;
      case "Q":
      case "q":
        letterToNumber.add(17);
        break;
      case "R":
      case "r":
        letterToNumber.add(18);
        break;
      case "S":
      case "s":
        letterToNumber.add(19);
        break;
      case "T":
      case "t":
        letterToNumber.add(20);
        break;
      case "U":
      case "u":
        letterToNumber.add(21);
        break;
      case "V":
      case "v":
        letterToNumber.add(22);
        break;
      case "W":
      case "w":
        letterToNumber.add(23);
        break;
      case "X":
      case "x":
        letterToNumber.add(24);
        break;
      case "Y":
      case "y":
        letterToNumber.add(25);
        break;
      case "Z":
      case "z":
        letterToNumber.add(26);
        break;
      case "Ä":
      case "ä":
        letterToNumber.add(27);
        break;
      case "Ü":
      case "ü":
        letterToNumber.add(28);
        break;
      case "Ö":
      case "ö":
        letterToNumber.add(29);
        break;
    }
  }
  List<int> reverseList = [];
  for (int i = input.length - 1; i >= 0; i--) {
    switch (input[i]) {
      case "A":
      case "a":
        reverseList.add(1);
        break;
      case "B":
      case "b":
        reverseList.add(2);
        break;
      case "C":
      case "c":
        reverseList.add(3);
        break;
      case "D":
      case "d":
        reverseList.add(4);
        break;
      case "E":
      case "e":
        reverseList.add(5);
        break;
      case "F":
      case "f":
        reverseList.add(6);
        break;
      case "G":
      case "g":
        reverseList.add(7);
        break;
      case "H":
      case "h":
        reverseList.add(8);
        break;
      case "I":
      case "i":
        reverseList.add(9);
        break;
      case "J":
      case "j":
        reverseList.add(10);
        break;
      case "K":
      case "k":
        reverseList.add(11);
        break;
      case "L":
      case "l":
        reverseList.add(12);
        break;
      case "M":
      case "m":
        reverseList.add(13);
        break;
      case "N":
      case "n":
        reverseList.add(14);
        break;
      case "O":
      case "o":
        reverseList.add(15);
        break;
      case "P":
      case "p":
        reverseList.add(16);
        break;
      case "Q":
      case "q":
        reverseList.add(17);
        break;
      case "R":
      case "r":
        reverseList.add(18);
        break;
      case "S":
      case "s":
        reverseList.add(19);
        break;
      case "T":
      case "t":
        reverseList.add(20);
        break;
      case "U":
      case "u":
        reverseList.add(21);
        break;
      case "V":
      case "v":
        reverseList.add(22);
        break;
      case "W":
      case "w":
        reverseList.add(23);
        break;
      case "X":
      case "x":
        reverseList.add(24);
        break;
      case "Y":
      case "y":
        reverseList.add(25);
        break;
      case "Z":
      case "z":
        reverseList.add(26);
        break;
      case "Ä":
      case "ä":
        reverseList.add(27);
        break;
      case "Ü":
      case "ü":
        reverseList.add(28);
        break;
      case "Ö":
      case "ö":
        reverseList.add(29);
        break;
    }
  }
  if (input == "") {
    return true;
  } else {
    return letterToNumber.toString() == reverseList.toString();
  }
}

class S3385 extends StatefulWidget {
  const S3385({Key? key}) : super(key: key);

  @override
  State<S3385> createState() => _S3385State();
}

class _S3385State extends State<S3385> {
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
            labelText: 'Text',
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
            final input = _inputController.text;
            setState(() {
              output = isPalindrome(input) ? 'Palindrom' : 'Kein Palindrom';
            });
          },
          child: const Text('Prüfe Palindrom'),
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
