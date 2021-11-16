import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum TipoIntervalo { trabalho, descanso }

abstract class _PomodoroStore with Store {
  @observable
  bool iniciado = false;

  @observable
  int minutos = 2;

  @observable
  int segundos = 0;

  @observable
  int tempoTrabalho = 2;

  @observable
  int tempoDescanso = 1;

  @observable
  TipoIntervalo tipoIntervalo = TipoIntervalo.descanso;

  Timer? cronometro;

  @action
  void iniciar() {
    iniciado = true;

    // Timer.periodic() cria uma funcao que é chamada
    // no periodo de intervalo especificado
    // nesse caso é chamada a cada um segundo
    cronometro = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      // verifica se o cronometro zerou e troca o intervalo
      if (minutos == 0 && segundos == 0) {
        _trocarTipoIntervalo();

        // verifica se os segundos chegou a zero
        // volta os segundos para 59
        // e decrementa um minuto
      } else if (segundos == 0) {
        segundos = 59;
        minutos--;
      } else {
        segundos--;
      }
    });
  }

  @action
  void parar() {
    iniciado = false;
    cronometro!.cancel();
  }

  @action
  void reiniciar() {
    iniciado = false;
  }

  @action
  void incrementarTempoTrabalho() {
    tempoTrabalho++;
  }

  @action
  void decrementarTempoTrabalho() {
    tempoTrabalho--;
  }

  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
  }

  @action
  void decrementarTempoDescanso() {
    tempoDescanso--;
  }

  bool estaTrabalhando() => tipoIntervalo == TipoIntervalo.trabalho;

  bool estaDescansando() => tipoIntervalo == TipoIntervalo.descanso;

  void _trocarTipoIntervalo() {
    if (estaTrabalhando()) {
      tipoIntervalo = TipoIntervalo.descanso;
      minutos = tempoDescanso;
    } else {
      tipoIntervalo = TipoIntervalo.trabalho;
      minutos = tempoTrabalho;
    }
    segundos = 0;
  }
}
