PImage[] fotogramas = new PImage[8];
PImage fondo;
float i=0;
float velocidad=0.2;
float posx=-100;

void preload() {
}

void setup() {
  size(400, 400);
  fotogramas[0]= loadImage("f1.png");
  fotogramas[1]= loadImage("f2.png");
  fotogramas[2]= loadImage("f3.png");
  fotogramas[3]= loadImage("f4.png");
  fotogramas[4]= loadImage("f5.png");
  fotogramas[5]= loadImage("f6.png");
  fotogramas[6]= loadImage("f7.png");
  fotogramas[7]= loadImage("f8.png");
  fondo=loadImage("sky.jpg");
}

void draw() {
  image(fondo, 0, 0, 400, 400);
  caminar();
}

void caminar() {
  image(fotogramas[floor(i)], posx, 100);
  posx= posx+1+velocidad;
  if (posx>400) {
    posx=-100;
  }
  i=i+velocidad;
  if (i>7) {
    i=0;
  }
}
