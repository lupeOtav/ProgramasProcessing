void dibujarPrimerPlano() {
  image(piedra, posxp, 250, piedra.width * piedraSize, piedra.height * piedraSize);
  image(corales, posxc, 290, corales.width * coralSize, corales.height * coralSize);
  actualizarPosicionesPP();
}

void actualizarPosicionesPP() {
  if (yendo) {
    posxp = posxp - piedrasVelocidad;
    posxc = posxc - coralVelocidad;
    posxr = posxr - rocaVelocidad;

    if (posxp < -300) {//cuando se reinicia y vuelve a aparecer cambia de tamaño
      posxp = 700;
      piedraSize = random(1.0, 2.5);
    }
    if (posxc < -200) {
      posxc = 700;
      coralSize = random(1.0, 2.5);
    }
    if (posxr < -500) {
      posxr = 700;
      rocaSize = random(1.0, 2.5);
    }
  } else {
    posxp = posxp + piedrasVelocidad;
    posxc = posxc + coralVelocidad;
    posxr = posxr + rocaVelocidad;

    if (posxp > 700) {
      posxp = -250;
      piedraSize = random(1.0, 2.5);
    }
    if (posxc > 700) {
      posxc = -250;
      coralSize = random(1.0, 2.5);
    }
    if (posxr > 700) {
      posxr = -250;
      rocaSize = random(1.0, 2.5);
    }
  }
}
