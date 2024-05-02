Boton miBoton;
Menu miMenu;
int escena = 0;
float valor;

void setup() {
  size(800, 600);
  miBoton = new Boton(230, 375, 150, 50, "Tirar dado");
  String[] opciones = {"Inicio", "Intro", "Jugar", "Ayuda"}; // Texto de los botones
  miMenu = new Menu(0, 0, width, 100, opciones.length, 50, opciones); // Crear el menú
}

void draw() {
  background(220);
  switch(escena) {
  case 0:
    mostrarInicio();
    break;
  case 1:
    mostrarIntroduccion();
    break;
  case 2:
    mostrarJuego();
    break;
  case 3:
    mostrarAyuda();
    break;
  }
  miMenu.mostrar();
}
void mousePressed() {
  if (miBoton.clickeado()) {
    // println("¡Se ha clickeado en el botón!");
    if (miBoton.getVisible()) {
      valor = random(1, 7);
    }
  }

  String mensaje = miMenu.clickeado();
  if (mensaje == null) {
    return;
  }
  switch(mensaje) {
  case "Inicio":
    escena = 0;
    break;
  case "Intro":
    escena = 1;
    break;
  case "Jugar":
    escena = 2;
    break;
  case "Ayuda":
    escena = 3;
    break;
  default:
    println("no deberia entrar aca");
  }
}

void mostrarInicio() {
  fill(0, 200, 255);
  rect(0, 0, width, height);
  fill(255);
  textSize(48);
  text("Nombre de mi juego", 400, 300);
  fill(0);
  textSize(24);
  text("Subtitulo si tuviera", 400, 340);
  textSize(14);
  text("(Todo esto podria ser una imagen)", 400, 380);
}

void mostrarIntroduccion() {
  fill(255, 150, 255);
  rect(0, 0, width, height);
  fill(255);
  textSize(30);
  text("Acá voy a contar la  historia, \nno necesariamente voy empezar por el principio, \ndependerá de la estructura del relato elegida", 400, 200);
  fill(0);
  textSize(24);
  text("Las historias tienen en general\n Inicio (I), Desarrollo(D) y Final(F). \nA esta forma se le llama estructura clásica.", 400, 310);
  textSize(18);
  text("Pero hay muchas opciones en cuanto al orden, \npor ejempo: \nI-D-F, \nF-D-I, \nI-F-D, \nF-I-D, \nD-F-I, \nD-I-F", 400, 460);
}

void mostrarJuego() {
  fill(80, 255, 80);
  rect(0, 0, width, height);
  fill(0);
  text("Aca pondria el juego si tuviera uno", 400, 300);
  fill(200, 255, 170);
  rect(380, 375, 50, 50);
  miBoton.mostrar();
  text(int(valor), 406, 400);
}

void mostrarAyuda() {
  fill(255, 255, 0);
  rect(0, 0, width, height);
  fill(0);
  text("Aca voy a escribir la ayuda con la descripcion \nde las mecanicas o lo que haga falta. \nSi tuviera que usar teclado y teclas especificas avisar, \nlo mismo si uso el clic o el arrastre del mouse", 400, 300);
}
