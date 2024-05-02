class Timer {
  int intervalo = 5000; // Intervalo de tiempo en milisegundos
  int tiempoAnterior = 0;

  Timer(int intervalo) {
    this.intervalo = intervalo;
    this.tiempoAnterior = millis();
  }

  boolean TiempoCumplido() {
    int tiempoActual = millis();
    int tiempoTranscurrido = tiempoActual - tiempoAnterior;

    // Manejar el desbordamiento de millis()
    if (tiempoTranscurrido < 0) {
      tiempoTranscurrido = 0;
    }

    if (tiempoTranscurrido > intervalo) {
      tiempoAnterior = tiempoActual;
      return true;
    }
    return false;
  }
}
