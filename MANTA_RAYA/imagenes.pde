void cargarImagenes(){
  piedra = loadImage("piedras.png");
  corales = loadImage("coral.png");
  roca = loadImage("roca.png");
  fondo = loadImage("mar3.jpg");
  imagenes = new PImage[12];
  for (int j = 0; j < 12; j++) {
    imagenes[j] = loadImage("f" + (j + 1) + ".png");
  }
  sonar = new PImage[5];
  for (int j = 0; j < 5; j++) {
    sonar[j] = loadImage("s" + (j + 1) + ".png");
  }
  medusas = new PImage[6];
  for (int j = 0; j < 6; j++) {
    medusas[j] = loadImage("m" + (j + 1) + ".png");
  }
}
