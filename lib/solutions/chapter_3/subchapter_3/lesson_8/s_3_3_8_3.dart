import 'package:flutter/material.dart';

FormattedTime formatSeconds(int seconds) {
  int hours = 0;
  int minutes = 0;
  if (seconds >= 3600) {
    hours = seconds ~/ 3600; // Sekunden in Stunden umwandeln
    minutes = (seconds % 3600) ~/ 60; // übrige Sekunden in Minuten umwandeln
    seconds = (seconds % 3600) % 60; // übrige Sekunden (Modulo) berechnen
  } else if (seconds >= 60) {
    // Bei weniger als 3600 Sekunden sind Stunden immer 0
    minutes = (seconds % 3600) ~/ 60;
    seconds = (seconds % 3600) % 60;
  } else {
    // Bei weniger als 60 Sekunden sind Stunden und Minuten immer 0
    seconds = seconds;
  }
  return FormattedTime(hours: hours, minutes: minutes, seconds: seconds);
}

class FormattedTime {
  final int hours;
  final int minutes;
  final int seconds;

  const FormattedTime({
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  @override
  String toString() {
    String result = "";
    if (hours > 0) {
      result += "$hours Stunden ";
    }
    if (minutes > 0) {
      result += "$minutes Minuten ";
    }
    if (seconds > 0) {
      result += "$seconds Sekunden";
    }
    return result;
  }
}

class S3383 extends StatefulWidget {
  const S3383({Key? key}) : super(key: key);

  @override
  State<S3383> createState() => _S3383State();
}

class _S3383State extends State<S3383> {
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
            labelText: 'Sekunden',
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
                  content: Text('Bitte eine Anzahl an Sekunden eingeben.'),
                ),
              );
              return;
            }
            setState(() {
              output = formatSeconds(input).toString();
            });
          },
          child: const Text('Formatiere'),
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
