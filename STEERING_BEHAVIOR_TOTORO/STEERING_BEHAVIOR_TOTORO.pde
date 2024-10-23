PImage totoro; // Imagen para los NPCs
PImage pelusa; // Imagen para el jugador
PImage fondo;

ArrayList<NPC> npcs = new ArrayList<NPC>();
int npcCount = 20;
ArrayList<PVector> targets = new ArrayList<PVector>();
Player player;
float maxForce = 0.1;
float maxSpeed = 2;
float perceptionRadius = 50;
float playerRadius = 70; // Radio de percepción para el jugador

void setup() {
  size(600, 600);
  
  // Cargar las imágenes
  totoro = loadImage("pelusa.png"); // Cargar la imagen del NPC
  pelusa = loadImage("totoro2.png"); // Cargar la imagen del jugador
  fondo = loadImage("room1.jpg"); // Cargar el fondo

  // Crear NPCs con posiciones y objetivos aleatorios
  for (int i = 0; i < npcCount; i++) {
    npcs.add(new NPC(random(width), random(height), maxForce, maxSpeed));
    targets.add(new PVector(random(width), random(height)));
  }

  // Crear personaje controlado por el jugador
  player = new Player(width / 2, height / 2);
}

void draw() {
  background(51);
  image(fondo, 0, 0, 600, 600);
  
  // Dibujar los objetivos
  for (PVector target : targets) {
    fill(255, 0, 0);
    noStroke();
    ellipse(target.x, target.y, 8, 8);
  }

  // Dibujar y actualizar al jugador
  player.update();
  player.show();

  // Actualizar y dibujar los NPCs
  for (int i = 0; i < npcs.size(); i++) {
    NPC npc = npcs.get(i);
    npc.applyBehaviors(npcs, targets.get(i), player);
    npc.update();
    npc.show();
  }
}

// Clase para el NPC
class NPC {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;
  float maxForce;

  NPC(float x, float y, float maxForce, float maxSpeed) {
    position = new PVector(x, y);
    velocity = PVector.random2D();
    acceleration = new PVector();
    this.maxSpeed = maxSpeed;
    this.maxForce = maxForce;
  }

  void applyBehaviors(ArrayList<NPC> npcs, PVector target, Player player) {
    PVector seekForce = seek(target);
    PVector cohesionForce = cohesion(npcs);
    PVector separationForce = separation(npcs);
    PVector alignmentForce = alignment(npcs);
    PVector avoidPlayerForce = avoidPlayer(player);

    // Dar más peso a la separación y evitar al jugador
    separationForce.mult(1.5);
    seekForce.mult(1.2);
    avoidPlayerForce.mult(2);

    // Aplicar las fuerzas
    applyForce(seekForce);
    applyForce(cohesionForce);
    applyForce(separationForce);
    applyForce(alignmentForce);
    applyForce(avoidPlayerForce);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);
    acceleration.mult(0);
  }

  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);
    desired.setMag(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    return steer;
  }

  PVector cohesion(ArrayList<NPC> npcs) {
    int total = 0;
    PVector steering = new PVector();
    for (NPC other : npcs) {
      float d = PVector.dist(position, other.position);
      if (other != this && d < perceptionRadius) {
        steering.add(other.position);
        total++;
      }
    }
    if (total > 0) {
      steering.div(total);
      steering.sub(position);
      steering.setMag(maxSpeed);
      PVector steer = PVector.sub(steering, velocity);
      steer.limit(maxForce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  PVector separation(ArrayList<NPC> npcs) {
    int total = 0;
    PVector steering = new PVector();
    for (NPC other : npcs) {
      float d = PVector.dist(position, other.position);
      if (other != this && d < perceptionRadius) {
        PVector diff = PVector.sub(position, other.position);
        diff.div(d);
        steering.add(diff);
        total++;
      }
    }
    if (total > 0) {
      steering.div(total);
    }
    if (steering.mag() > 0) {
      steering.setMag(maxSpeed);
      steering.sub(velocity);
      steering.limit(maxForce);
    }
    return steering;
  }

  PVector alignment(ArrayList<NPC> npcs) {
    int total = 0;
    PVector steering = new PVector();
    for (NPC other : npcs) {
      float d = PVector.dist(position, other.position);
      if (other != this && d < perceptionRadius) {
        steering.add(other.velocity);
        total++;
      }
    }
    if (total > 0) {
      steering.div(total);
      steering.setMag(maxSpeed);
      PVector steer = PVector.sub(steering, velocity);
      steer.limit(maxForce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  PVector avoidPlayer(Player player) {
    float d = PVector.dist(position, player.position);
    if (d < playerRadius) {
      PVector flee = PVector.sub(position, player.position);
      flee.setMag(maxSpeed);
      PVector steer = PVector.sub(flee, velocity);
      steer.limit(maxForce);
      return steer;
    }
    return new PVector(0, 0);
  }

  void show() {
    // Dibujar la imagen del NPC (Totoro)
    image(totoro, position.x, position.y, 32, 32); // Ajustar tamaño de la imagen
  }
}

// Clase para el personaje controlado por el jugador
class Player {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;

  Player(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
    maxSpeed = 3;
  }

  void update() {
    acceleration.mult(0); // Limpiar aceleración

    if (keyPressed) {
      if (keyCode == LEFT) {
        acceleration.x = -0.2;
      } else if (keyCode == RIGHT) {
        acceleration.x = 0.2;
      } else if (keyCode == UP) {
        acceleration.y = -0.2;
      } else if (keyCode == DOWN) {
        acceleration.y = 0.2;
      }
    }

    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);
  }

  void show() {
    // Dibujar la imagen del jugador (Pelusa)
    image(pelusa, position.x, position.y, 64, 64); // Ajustar tamaño de la imagen
  }
}
