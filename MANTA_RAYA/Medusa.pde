void dibujarMedusa() {
  image(medusas[floor(m)], posxm, posym, 72, 72);
  actualizarPosicionMedusa();
}

void mostrarBoundingBoxMedusa(){
  noFill();
  stroke(255, 0, 0);
  rect(posxm, posym, 72, 72); 
}

void actualizarPosicionMedusa(){
  posxm = posxm - 1;
  posym = posym + amplitud * sin(frecuencia * posxm);
  if (posxm < 0) {
    posxm = 700;
    posym = 100;
  }
  m = m + frecuencia;
  if (m > 5) {
    m = 0;
  }
}
