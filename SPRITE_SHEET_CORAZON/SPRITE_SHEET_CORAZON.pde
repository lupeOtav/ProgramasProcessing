PImage[] fotogramas = new PImage[8];
float i = 0;
float velocidad = 0.2; // Reduje la velocidad para que sea más suave
float t=0;
PFont[] miFuentes = new PFont[5];
float fuenteSeleccionada = 0;

void setup() {
  size(400, 500);

  miFuentes[0] = createFont("Amatic.ttf", 32);
  miFuentes[1] = createFont("Lobster.ttf", 24);
  miFuentes[2] = createFont("DancingScript.ttf", 24);
  miFuentes[3] = createFont("Sacramento.ttf", 28);
  miFuentes[4] = createFont("GreatVibes.ttf", 32);
  
  for (int j=0; j<8; j++) {
    fotogramas[j] = loadImage("c" + (j + 1) + ".png");
  }
}

void draw() {
  background(100, 0, 120);
  
  fuenteSeleccionada = fuenteSeleccionada + 0.02;
  if (fuenteSeleccionada > 4){
   fuenteSeleccionada = 0; 
  }
  textFont(miFuentes[floor(fuenteSeleccionada)]);
  
  
  float y = 200 + sin(t) * 120; // Movimiento sinusoidal, periodico y continuo
  float y2 = 200 + cos(t) * 120;
  text("Maldición va a ser un día hermoso", 40, y2);
  image(fotogramas[floor(i)], width/3, y);

  i = i + velocidad;
  t=t+0.01;  
  if (i > 7) {
    i = 0;
  } 
}
