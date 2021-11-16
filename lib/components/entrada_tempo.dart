import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;
  final Function()? inc;
  final Function()? dec;

  const EntradaTempo({
    Key? key,
    required this.titulo,
    required this.valor,
    this.inc,
    this.dec,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Column(
      children: [
        Text(
          titulo,
          style: const TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 10),
        Observer(
          builder: (_) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: dec,
                child: const Icon(Icons.arrow_downward),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                  primary: store.estaTrabalhando() ? Colors.red : Colors.green,
                ),
              ),
              Text(
                '$valor min',
                style: const TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                onPressed: inc,
                child: const Icon(Icons.arrow_upward),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                  primary: store.estaTrabalhando() ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
