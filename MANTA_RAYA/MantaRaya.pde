void dibujarManta() {
  actualizarPosicionManta();
  image(imagenes[floor(i)], posx, posy);
  dibujarSonar();
  siguienteImagen();
}
void dibujarSonar() {
  if (sonarActivo && yendo) {
    image(sonar[floor(s)], posx + imagenes[floor(i)].width, posy);
    s = s + velocidad;
    if (s > 4) {
      sonarActivo = false;
    }
  }
}
void mostrarBoundingBoxManta() {
  noFill();
  stroke(0, 255, 0);
  rect(posx, posy, imagenes[floor(i)].width, imagenes[floor(i)].height);
}

void actualizarPosicionManta() {
  if (keyPressed) {
    if (keyCode == UP) {
      posy = posy - 10;
    }
    if (keyCode == DOWN) {
      posy = posy + 10;
    }
    if (keyCode == LEFT) {
      yendo = false;
      posx = posx - 10;
      i = 6;
    }
    if (keyCode == RIGHT) {
      yendo = true;
      posx = posx + 10;
      i = 0;
    }
  }

  posy = constrain(posy, 0, 400 - imagenes[floor(i)].height);
  posx = constrain(posx, 0, 600 - imagenes[floor(i)].width);
}

void siguienteImagen() {
  i = i + velocidad;
  if (yendo) {
    if (i > 5) {
      i = 0;
    }
  } else {
    if (i > 11) {
      i = 6;
    }
  }
}

void morirse() {
  muerto = true;
}

boolean chequearColision() {
  return (posx + 20 < posxm + 72 && posx + 125 > posxm && posy < posym + 72 && posy + 71 > posym);
}
