import java.util.ArrayList;
import java.util.Iterator;

ArrayList<Elemento> bazofias;
PImage fondo;

void setup() {
  size(840, 600);
  fondo = loadImage("FONDO3.jpg");
  bazofias = new ArrayList<Elemento>();
  crearBazofias();
}

void draw() {
  image(fondo, 0, 0, 840, 600);
  textSize(32);
  if (bazofias.size()>0) {
    text("Despeja todas las bazofias del terreno", 100, 100);
    for (int i = 0; i < bazofias.size(); i++) {
      Elemento e = bazofias.get(i);
      e.mostrar();
    }
  } else {
    text("Excelente trabajo", 100, 100);
  }
}

void crearBazofias() {
  for (int j=0; j<10; j++) {
    PImage imagen = loadImage("B"+ (j+1)+".png");
    bazofias.add(new Elemento("Nueva bazofia " + j, imagen, random(100, 700), random(250, 500)));
  }
}

void mousePressed() {
  Iterator<Elemento> iter = bazofias.iterator();
  while (iter.hasNext()) {
    Elemento e = iter.next();
    if (e.hover()) {
      iter.remove();
    }
  }
}
