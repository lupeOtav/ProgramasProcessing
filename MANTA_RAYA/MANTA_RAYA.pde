import processing.sound.*;

void setup() {
  size(600, 400);
  sonido = new SoundFile(this, "bajoElMar.mp3");
  
  cargarImagenes();
}

void draw() {
  background(220);
  dibujarFondo();
  dibujarMedusa();

  if (!muerto) {
    dibujarManta();
    if (chequearColision()) {//si la manta choca con la medusa
      morirse();
    }
  } else {
    textSize(24);
    fill(255);
    text("Oh No!!! Moriste envenenado por la medusa!", 60, 350);
  }
  if (mostrarBoundingBox) {
    mostrarBoundingBoxMedusa();
    if (!muerto) {
      mostrarBoundingBoxManta();
    }
  }
  dibujarPrimerPlano();
  dibujarBoton();
}

void dibujarBoton() {
  fill(0);
  rect(500, 10, 90, 20);
  fill(255);
  textSize(10);
  text("Bounding boxes", 510, 25, 100);
}
