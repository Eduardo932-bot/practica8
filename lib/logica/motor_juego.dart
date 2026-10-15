import '../modelos/carta.dart';
import 'baraja.dart';
import 'tabla.dart';
import 'verificador_patrones.dart';

class MotorJuego {
  final Baraja baraja;
  final Tabla tabla;
  bool haGanado = false;
  int cartasCantadas = 0;

  MotorJuego({required this.baraja, required this.tabla});

  Carta? cantarYMarcar() {
    final carta = baraja.cantarSiguiente();
    if (carta == null) return null;
    cartasCantadas++;
    tabla.marcar(carta);
    if (VerificadorPatrones.hayGanador(tabla.marcadas)) {
      haGanado = true;
    }
    return carta;
  }
}

class MotorJuegoDosJugadores {
  final Baraja baraja;
  final Tabla tablaJugador1;
  final Tabla tablaJugador2;
  
  bool ganoJugador1 = false;
  bool ganoJugador2 = false;
  int cartasCantadas = 0;

  MotorJuegoDosJugadores({
    required this.baraja,
    required this.tablaJugador1,
    required this.tablaJugador2,
  });

  Carta? cantarYMarcarAutomatico() {
    final carta = baraja.cantarSiguiente();
    if (carta == null) return null;
    cartasCantadas++;

    tablaJugador1.marcar(carta);
    tablaJugador2.marcar(carta);

    if (VerificadorPatrones.hayGanador(tablaJugador1.marcadas)) {
      ganoJugador1 = true;
    }
    if (VerificadorPatrones.hayGanador(tablaJugador2.marcadas)) {
      ganoJugador2 = true;
    }

    return carta;
  }
}