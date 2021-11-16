import 'package:flutter/material.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;

  const EntradaTempo({
    Key? key,
    required this.titulo,
    required this.valor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titulo,
          style: const TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.arrow_downward),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
                primary: Colors.red,
              ),
            ),
            Text(
              '$valor min',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.arrow_upward),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
                primary: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
