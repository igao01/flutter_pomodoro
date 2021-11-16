import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/cronometro.dart';
import 'package:pomodoro/components/entrada_tempo.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                child: Cronometro(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Observer(
                  builder: (_) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EntradaTempo(
                        titulo: 'Trabalho',
                        valor: store.tempoTrabalho,
                        inc: store.iniciado && store.estaTrabalhando()
                            ? null
                            : store.incrementarTempoTrabalho,
                        dec: store.iniciado && store.estaTrabalhando()
                            ? null
                            : store.decrementarTempoTrabalho,
                      ),
                      EntradaTempo(
                        titulo: 'Descanso',
                        valor: store.tempoDescanso,
                        inc: store.iniciado && store.estaDescansando()
                            ? null
                            : store.incrementarTempoDescanso,
                        dec: store.iniciado && store.estaDescansando()
                            ? null
                            : store.decrementarTempoDescanso,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
