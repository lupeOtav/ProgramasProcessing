ArrayList<Agente> agentes = new ArrayList<Agente>();
int numAgentes = 100; // Número de agentes
Jugador jugador;
PImage[] fotogramasArriba = new PImage[4];
PImage[] fotogramasAbajo = new PImage[4];
PImage[] fotogramasIzquierda = new PImage[4];
PImage[] fotogramasDerecha = new PImage[4];
PImage terminal;
PImage terminal2;
PImage[] fotogramasJugadorArriba = new PImage[4];
PImage[] fotogramasJugadorAbajo = new PImage[4];
PImage[] fotogramasJugadorIzquierda = new PImage[4];
PImage[] fotogramasJugadorDerecha = new PImage[4];
float jugadorVelocidad = 8; // Velocidad del jugador
int radioDePercepción = 50; // Radio de percepción para la repulsión
PVector direccion = null; // Dirección del jugador

void setup() {
  size(800, 600);
  
  // Cargar imágenes de los NPCs
  for (int i = 0; i < 4; i++) {
    fotogramasArriba[i] = loadImage("s" + i + ".png"); // Sprites de subir
    fotogramasAbajo[i] = loadImage("b" + i + ".png"); // Sprites de bajar
    fotogramasIzquierda[i] = loadImage("i" + i + ".png"); // Sprites de izquierda
    fotogramasDerecha[i] = loadImage("d" + i + ".png"); // Sprites de derecha
  }
  
  // Cargar imágenes del jugador
  for (int i = 0; i < 4; i++) {
    fotogramasJugadorArriba[i] = loadImage("jugador_b" + i + ".png"); // Sprites de subir
    fotogramasJugadorAbajo[i] = loadImage("jugador_s" + i + ".png"); // Sprites de bajar
    fotogramasJugadorIzquierda[i] = loadImage("jugador_i" + i + ".png"); // Sprites de izquierda
    fotogramasJugadorDerecha[i] = loadImage("jugador_d" + i + ".png"); // Sprites de derecha
  }
  
  // Crear el jugador en el centro
  jugador = new Jugador(width / 2, height / 2);
  
  // Cargar imágenes de fondo
  terminal = loadImage("fondo.jpg");
  terminal2 = loadImage("fondo_borde.png");

  // Crear agentes en posiciones aleatorias
  for (int i = 0; i < numAgentes; i++) {
    agentes.add(new Agente(random(width), random(height)));
  }
}

void draw() {
  background(200);
  image(terminal, 0, 0, 800, 600);
  
  // Actualizar y mostrar cada agente
  for (Agente agente : agentes) {
    agente.update();
    agente.show();
  }

  // Mostrar el jugador
  jugador.update();
  jugador.show();
  
  image(terminal2, 0, 0, 800, 600);
}

void keyPressed() {
  if (keyCode == LEFT) {
    direccion = new PVector(-5, 0); // Mover a la izquierda
  } else if (keyCode == RIGHT) {
    direccion = new PVector(5, 0); // Mover a la derecha
  } else if (keyCode == UP) {
    direccion = new PVector(0, -5); // Mover hacia arriba
  } else if (keyCode == DOWN) {
    direccion = new PVector(0, 5); // Mover hacia abajo
  }
}

void keyReleased() {
  direccion = null; // Detener el movimiento cuando se suelta la tecla
}

// Clase Agente
class Agente {
  PVector position;
  PVector velocity;
  float maxSpeed = 2; // Velocidad máxima del agente
  int size = 30; // Tamaño del agente
  int fotogramaIndex = 0;
  int animacionTiempo = 0;

  Agente(float x, float y) {
    position = new PVector(x, y);
    velocity = PVector.random2D();
  }

  void update() {
    // Comprobar la cercanía del jugador
    PVector repulsion = new PVector();
    float d = PVector.dist(position, jugador.position);

    if (d < radioDePercepción) {
      // Calcular dirección de repulsión
      PVector diff = PVector.sub(position, jugador.position);
      diff.setMag(maxSpeed);
      repulsion.add(diff);
    }

    // Actualizar posición
    velocity.add(repulsion);
    velocity.limit(maxSpeed);
    position.add(velocity);

    // Limitar los agentes dentro del canvas
    edges();
    
    // Cambiar la animación según la dirección del movimiento
    updateAnimation();
  }

  void show() {
    // Mostrar agente según dirección
    if (velocity.y < 0) {
      image(fotogramasArriba[floor(fotogramaIndex)], position.x, position.y, size, size);
    } else if (velocity.y > 0) {
      image(fotogramasAbajo[floor(fotogramaIndex)], position.x, position.y, size, size);
    } else if (velocity.x < 0) {
      image(fotogramasIzquierda[floor(fotogramaIndex)], position.x, position.y, size, size);
    } else if (velocity.x > 0) {
      image(fotogramasDerecha[floor(fotogramaIndex)], position.x, position.y, size, size);
    } else {
      // Si no se mueve, muestra un fotograma estático
      image(fotogramasAbajo[0], position.x, position.y, size, size);
    }
  }

  void updateAnimation() {
    // Controlar la velocidad de la animación
    animacionTiempo++;
    if (animacionTiempo >= 5) { // Ajusta este valor para cambiar la velocidad de la animación
      animacionTiempo = 0;
      fotogramaIndex = (fotogramaIndex + 1) % 4; // Ciclar entre 4 fotogramas
    }
  }

  void edges() {
    // Volver a aparecer del otro lado
    if (position.x > width) position.x = 0;
    if (position.x < 0) position.x = width;
    if (position.y > height) position.y = 0;
    if (position.y < 0) position.y = height;
  }
}

// Clase Jugador
class Jugador {
  PVector position;
  int fotogramaIndex = 0; // Para la animación
  String direction = "abajo"; // Dirección inicial

  Jugador(float x, float y) {
    position = new PVector(x, y);
  }

  void update() {
    // Controlar el movimiento del jugador
    if (keyPressed && keyCode == UP) {
      position.y -= jugadorVelocidad;
      direction = "arriba";
    } else if (keyPressed && keyCode == DOWN) {
      position.y += jugadorVelocidad;
      direction = "abajo";
    } else if (keyPressed && keyCode == LEFT) {
      position.x -= jugadorVelocidad;
      direction = "izquierda";
    } else if (keyPressed && keyCode == RIGHT) {
      position.x += jugadorVelocidad;
      direction = "derecha";
    }

    // Limitar el jugador dentro del canvas
    position.x = constrain(position.x, 60, 700);
    position.y = constrain(position.y, 100, 500);

    updateAnimation(); // Actualizar animación
  }

  void show() {
    pushMatrix();
    translate(position.x, position.y);
    if (direction.equals("arriba")) {
      image(fotogramasJugadorArriba[floor(fotogramaIndex)], 0, 0, 30, 40);
    } else if (direction.equals("abajo")) {
      image(fotogramasJugadorAbajo[floor(fotogramaIndex)], 0, 0, 30, 40);
    } else if (direction.equals("izquierda")) {
      image(fotogramasJugadorIzquierda[floor(fotogramaIndex)], 0, 0, 30, 40);
    } else if (direction.equals("derecha")) {
      image(fotogramasJugadorDerecha[floor(fotogramaIndex)], 0, 0, 30, 40);
    }
    popMatrix();
  }

  void updateAnimation() {
    fotogramaIndex = floor((fotogramaIndex + 0.1)) % 4; // Ciclar entre 4 fotogramas
  }
}
