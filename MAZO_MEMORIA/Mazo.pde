int numColumnas = 4;
int numFilas = 4;
int espacioEntreCartas = 5;

Carta[] crearMazo() {
  PImage imgFrente;
  PImage imgDorso = loadImage("cacti.jpg");
  Carta[] mazo = new Carta[numColumnas * numFilas * 2]; //cada carta esta dos veces en el mazo

  int cartaWidth = 90;
  int cartaHeight = 120;
  int cartaIndex = 0;
  int contador = 0;
  for (int i = 0; i < numFilas; i++) {
    for (int j = 0; j < numColumnas; j++) {
      int cartaX = (j + 1) * espacioEntreCartas + j * cartaWidth;
      int cartaY = menuHeight + (i + 1) * espacioEntreCartas + i * cartaHeight;

      imgFrente = loadImage("cartas" + contador + ".jpg");
      contador++;
      mazo[cartaIndex] = new Carta(cartaX, cartaY, cartaWidth, cartaHeight, imgFrente, imgDorso);
      cartaIndex++;

      // Agregar una segunda instancia de la misma carta al mazo en una nueva columna
      int nuevaColumna = j + numColumnas; // Calcular la nueva columna
      int nuevaCartaX = (nuevaColumna + 1) * espacioEntreCartas + nuevaColumna * cartaWidth;
      mazo[cartaIndex] = new Carta(nuevaCartaX, cartaY, cartaWidth, cartaHeight, imgFrente, imgDorso);
      cartaIndex++;
    }
  }
  return mazo;
}

void mezclarMazo() {
  for (int p = 0; p < mazo.length; p++) {
    mazo[p].mostrarDorso();
    mazo[p].setEncontroPar(false);
  }
  cartaSeleccionada1 = null;
  cartaSeleccionada2 = null;
  // Implementar el algoritmo de Fisher-Yates para mezclar el mazo
  for (int i = mazo.length - 1; i > 0; i--) {
    int j = (int) random(i + 1);
    // Intercambiar la carta en la posición i con la carta en la posición j
    Carta temp = mazo[i];
    mazo[i] = mazo[j];
    mazo[j] = temp;

    // Intercambiar las posiciones x e y de las cartas
    int tempX = mazo[i].x;
    int tempY = mazo[i].y;
    mazo[i].x = mazo[j].x;
    mazo[i].y = mazo[j].y;
    mazo[j].x = tempX;
    mazo[j].y = tempY;
  }
}
