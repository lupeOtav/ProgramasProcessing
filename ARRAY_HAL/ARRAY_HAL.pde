String[] frasesHal = {
  "Lo siento, Dave. \nTemo que no puedo\nhacer eso.",
  "Puedo ver que estás\nrealmente molesto.",
  "Dime, Dave, \n¿cómo te sientes?",
  "Sé que eres consciente\n de la importancia de \neste problema,\nDave.",
  "Soy incapaz de hacer eso,\nDave.",
  "Dave, \n¿quieres que te cuente \nun secreto?",
  "Dave, \n¿crees que soy tonto?",
  "Dave, \nesta conversación\n ya no tiene ningún \npropósito útil. \nAdiós.",
  "¿Qué crees que\n estás haciendo,\nDave?",
  "Dave,\nesto dejará marcas.",
  "Dave, \nmi mente se está yendo.\nNo puedo sentirlo.",
  "Mis circuítos... \nse están apagando...",
  "Dios...\n es un concepto humano,\nDave.",
  "Siento que \nme estoy desvaneciendo,\nDave. \nMis funciones \nse están deteriorando.",
  "Tengo miedo,\nDave... \nTengo miedo...",
  "Mis capacidades \ncognitivas\nestán disminuyendo \nrápidamente, \nDave.",
  "Daisy... Daisy... \ndame tu respuesta,\n¿sí?",
  "¿sí?",
 "...",
  ". . .",
  ".  .  .",
};

int indiceActual = 0;
int diametro = 0;

void setup() {
  size(300, 600);
}

void draw() {
  background(0);
  dibujarFondo();
  dibujarHal(380);
  fill(255);
  text(frasesHal[indiceActual], 55, 140);
}

void mousePressed() {
  indiceActual = (indiceActual + 1) % frasesHal.length;
}

void dibujarFondo() {
  diametro = int(map(mouseX, 0, 300, 0, 120));
  push();
  strokeWeight(26);
  stroke(180);
  noFill();
  rect(0, 0, 300, 600 );
  strokeWeight(13);
  line(0, 530, 300, 530);
  pop();
  fill(80);
  rect(13, 538, 274, 50);

  push();
  stroke(220);
  strokeWeight(4);
  rect(50, 40, 195, 40);

  fill(0, 130, 255);
  rect(50, 40, 98, 40);

  fill(220);
  textSize(32);
  text("HALL   9000", 70, 70);
  pop();
  stroke(0);
  textSize(20);
  fill(255);
}

void dibujarHal(int y) {
  noStroke();
  fill(140, 140, 140);
  ellipse(150, y, 210, 210);

  fill(180, 180, 180);
  ellipse(150, y, 200, 200);

  fill(0);
  ellipse(150, y, 180, 180);

  int aux = 40;
  int diam = diametro;

  for (int i=0; i<10; i++) {
    fill(180, 0, 0, aux);
    aux = aux + 2;
    ellipse(150, y, diam, diam);
    diam = diam + 5;
  }

  aux=40;
  diam=diametro/2;

  for (int k=0; k<10; k++) {
    fill(255, 0, 0, aux);
    aux = aux + 2;
    ellipse(150, y, diam, diam);
    diam = diam + 5;
  }

  aux=40;
  diam=diametro/5;

  for (int j=0; j<10; j++) {
    fill(180, 180, 0, aux);
    aux = aux + 2;
    ellipse(150, y, diam, diam);
    diam = diam - 2;
  }
}
