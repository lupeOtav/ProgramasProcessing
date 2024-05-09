import processing.video.*;

PImage[] fondos = new PImage[2];
Capture cam;
boolean hiceClick = false;
PImage[] personajes = new PImage[8];
float i = 0;
float velocidad = 0.2;
int f = 0;
int posx = 80;
int posy = 250;

void setup() {
  size(640, 480);
  
  // Inicializa la cámara
  String[] cameras = Capture.list();
  if (cameras.length > 0) {
    cam = new Capture(this, cameras[0]);
    cam.start();
  }
  
  for (int x=0; x<2; x++) {
    fondos[x] = loadImage("q"+ x +".jpg");
  }
  for (int j=0; j<8; j++) {
    personajes[j] = loadImage("f" + (j + 1) + ".png");
  }
}

void draw() {
  if (cam != null && cam.available()) {
    cam.read(); // Lee el siguiente fotograma de la cámara
  }
  
  if (hiceClick) {
    image(cam, 0, 0, width, height); // Muestra el contenido de la cámara como fondo
  } else {
    image(fondos[f], 0, 0, width, height); // Muestra la imagen de fondo
  }
  
  image(personajes[floor(i)], posx, posy, 120, 180);
  i = i + velocidad;
  if (i > 7) {
    i = 0;
  }
}

void mousePressed() {
  hiceClick = !hiceClick; // Alterna entre la cámara y la imagen de fondo cuando se hace clic
  f++;
  if (f > 1) {
    f = 0;
  }
}

void mouseDragged(){
  posx = mouseX;
  posy = mouseY;
}
