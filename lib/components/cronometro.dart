import 'package:flutter/material.dart';
import 'package:pomodoro/components/cronometro_botao.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hora de trabalhar',
            style: TextStyle(
              fontSize: 36,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            '25:00',
            style: TextStyle(
              fontSize: 120,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CronometroBotao(
                  texto: 'Iniciar',
                  icone: Icons.play_arrow,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 10),
              //   child: CronometroBotao(
              //     texto: 'Parar',
              //     icone: Icons.stop,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CronometroBotao(
                  texto: 'Reiniciar',
                  icone: Icons.refresh,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
