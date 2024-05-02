Carta[] mazo;

int menuHeight = 50; // Altura del menú
Carta cartaSeleccionada1 = null; // Primera carta seleccionada
Carta cartaSeleccionada2 = null; // Segunda carta seleccionada

void settings() {
  size(800, 600);
}

void setup() {
  mazo = crearMazo();
  mezclarMazo();
}

void draw() {
  background(80);
  fill(255);
  textSize(24);
  text("Mezclar mazo", 640, 40);
  for (int i = 0; i < mazo.length; i++) {
    mazo[i].mostrar();
  }
}

void mousePressed() {
  if (mouseY > menuHeight) {
    for (int i = 0; i < mazo.length; i++) {
      if (mazo[i].clickeada()) {
        mazo[i].darVuelta();
        if (cartaSeleccionada1 == null) {
          cartaSeleccionada1 = mazo[i]; // Almacenar la primera carta seleccionada
        } else if (cartaSeleccionada2 == null) {
          cartaSeleccionada2 = mazo[i]; // Almacenar la segunda carta seleccionada
          if (cartaSeleccionada1 != cartaSeleccionada2 && cartaSeleccionada1.frente == cartaSeleccionada2.frente) {
            // Si forman un par, dejarlas descubiertas y reiniciar la selección
            cartaSeleccionada1.setEncontroPar(true);
            cartaSeleccionada2.setEncontroPar(true);
            cartaSeleccionada1 = null;
            cartaSeleccionada2 = null;
          }
        } else if (cartaSeleccionada1 != null && cartaSeleccionada2 != null) {
          // no hubo par
          cartaSeleccionada1.darVuelta();
          cartaSeleccionada2.darVuelta();
          cartaSeleccionada1 = mazo[i];
          cartaSeleccionada2 = null;
        }
      }
    }
  } else {
    mezclarMazo();
  }
}
