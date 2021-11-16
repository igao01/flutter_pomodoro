import 'package:pomodoro/components/cronometro.dart';
import 'package:pomodoro/components/entrada_tempo.dart';
import 'package:flutter/material.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Cronometro(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EntradaTempo(
                      titulo: 'Trabalho',
                      valor: 25,
                    ),
                    EntradaTempo(
                      titulo: 'Descanso',
                      valor: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
