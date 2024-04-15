// ignore: unused_import
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

bool isAnagram(String word1, String word2) {
  String word1ToLowerCase = word1.toLowerCase();
  String word2ToLowerCase = word2.toLowerCase();
  List<String> word1ToChars = [];
  List<String> word2ToChars = [];

  if (word1 == "" && word2 == "") {
    return true;
  }

  for (int i = 0; i < word1ToLowerCase.length; i++) {
    word1ToChars.add(word1ToLowerCase[i]);
  }
  for (int i = 0; i < word2ToLowerCase.length; i++) {
    word2ToChars.add(word2ToLowerCase[i]);
  }
  word1ToChars.sort();
  word2ToChars.sort();
  return word1ToChars.toString() == word2ToChars.toString();
}

class S3386 extends StatefulWidget {
  const S3386({Key? key}) : super(key: key);

  @override
  State<S3386> createState() => _S3386State();
}

class _S3386State extends State<S3386> {
  final TextEditingController _input1Controller = TextEditingController();
  final TextEditingController _input2Controller = TextEditingController();
  String? output;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _input1Controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Wort 1',
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: _input2Controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Wort 2',
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
            final input1 = _input1Controller.text;
            final input2 = _input2Controller.text;
            setState(() {
              output = isAnagram(input1, input2) ? 'Anagram' : 'Kein Anagram';
            });
          },
          child: const Text('Prüfe Anagram'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _input1Controller.dispose();
    super.dispose();
  }
}
