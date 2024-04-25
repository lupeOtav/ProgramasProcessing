Boton[] botones = new Boton[10];
String[] fuentes = {"Arial", "Helvetica", "Times New Roman", "Courier New", "Verdana", "Tahoma", "Georgia", "Comic Sans MS"};
String[] respuestas = {
  "¡Hey! ¿Qué haces?",
  "¿Podrías no hacer eso, por favor?",
  "¡Che! No me toques así.",
  "¿Puedo ayudarte en algo?",
  "¡Eh! Eso no está bien.",
  "¿Necesitas algo?",
  "¿Qué se supone que estás haciendo?",
  "Por favor, no me toques sin permiso.",
  "¡Cuidado ahí!",
  "¿Puedo ayudarte?",
  "¡Epa! No toques sin permiso.",
  "¿Qué necesitas?",
  "¡Para, por favor!",
  "¿Por qué me tocas?",
  "¡Ey! ¿Qué te pasa?",
  "Por favor, respeta mi espacio personal."
};

void setup() {
  size(800, 400);
  int x=100;

  for (int i=0; i<10; i++) {
    botones[i] = new Boton(x, 100, 50, 20);
    x=x+55;
  }
  background(220);
}

void draw() {
  for (int i=0; i<10; i++) {
    botones[i].mostrar();
  }
}

void mousePressed() {
  int valorAleatorio;

  for (int i=0; i<10; i++) {
    if ( botones[i].clickeado()) {
      valorAleatorio = (int) random(2) * 255;
      fill(valorAleatorio);
      PFont fuente = createFont(fuentes[int(random(7))], random(11, 48));
      textFont(fuente);
      text(respuestas[int(random(16))], random(10, 600), random(10, 380));
    }
  }
}
