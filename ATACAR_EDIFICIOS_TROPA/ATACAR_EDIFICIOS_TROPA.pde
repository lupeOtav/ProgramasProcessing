PImage[] followerImagesRight = new PImage[9];
PImage[] followerImagesLeft = new PImage[9];
PImage edificio1, edificio2, edificio3, fondo;

Troop leader;
ArrayList<Troop> followers = new ArrayList<Troop>();
int numFollowers = 5;
ArrayList<PVector> enemies = new ArrayList<>(); // Arreglo para almacenar edificios enemigos
PVector attackTarget = null; // Variable para almacenar el objetivo de ataque
float followerAnimationIndex = 0;
float followerAnimationSpeed = 0.1;

void setup() {
  size(800, 800);
  
  // Cargar imágenes
  preload();

  // Crear el líder
  leader = new Troop(width / 2, height / 2);

  // Crear seguidores
  for (int i = 0; i < numFollowers; i++) {
    Troop follower = new Troop(
      leader.position.x,
      leader.position.y + (i + 1) * 20
    );
    followers.add(follower); // Asegúrate de que followers sea una ArrayList<Troop>
  }

  // Crear edificios enemigos
  enemies.add(new PVector(100, 100)); // Edificio 1
  enemies.add(new PVector(400, 200)); // Edificio 2
  enemies.add(new PVector(600, 500)); // Edificio 3
}

void draw() {
  background(51, 40);
  image(fondo, 0, 0, 800, 800);

  // Dibujar edificios enemigos
  for (PVector enemy : enemies) {
    // Hacer clic en toda el área de la imagen
    if (dist(mouseX, mouseY, enemy.x + 75, enemy.y + 75) < 75) {
      fill(255, 0, 0, 150); // Color de selección
      rect(enemy.x, enemy.y, 150, 150);
    }

    // Mostrar edificios
    if (enemy.equals(enemies.get(0))) {
      image(edificio1, enemy.x, enemy.y, 150, 150);
    } else if (enemy.equals(enemies.get(1))) {
      image(edificio2, enemy.x, enemy.y, 150, 150);
    } else {
      image(edificio3, enemy.x, enemy.y, 150, 150);
    }
  }

  // Actualizar y dibujar al líder
  leader.update();
  leader.display();

  // Actualizar y dibujar a los seguidores
  for (Troop follower : followers) {
    follower.follow(leader, followers, attackTarget); // Pasar el objetivo de ataque
    follower.update();
    follower.display();
  }

  // Manejar la animación de los seguidores
  followerAnimationIndex += followerAnimationSpeed;
  if (followerAnimationIndex >= followerImagesRight.length) {
    followerAnimationIndex = 0; // Reiniciar la animación
  }
}

// Cargar imágenes
void preload() {
  // Cargar las imágenes de los edificios
  edificio1 = loadImage("C20.png");
  edificio2 = loadImage("C6.png");
  edificio3 = loadImage("C9.png");
  fondo = loadImage("FONDO.jpg");

  // Cargar las imágenes de la animación de los seguidores hacia la derecha
  for (int i = 0; i < followerImagesRight.length; i++) {
   // followerImagesRight[i] = loadImage("t" + (i + 1) + ".png"); // Cargar imágenes de t1.png a t9.png
  }

  // Cargar las imágenes de la animación de los seguidores hacia la izquierda
  for (int i = 0; i < followerImagesLeft.length; i++) {
    followerImagesLeft[i] = loadImage("a" + (i + 1) + ".png"); // Cargar imágenes de a1.png a a9.png
  }
}

// Manejar clics del mouse
void mousePressed() {
  // Verificar si se hizo clic en un edificio enemigo
  for (PVector enemy : enemies) {
    if (mouseX >= enemy.x && mouseX <= enemy.x + 150 && mouseY >= enemy.y && mouseY <= enemy.y + 150) {
      attackTarget = enemy.copy(); // Establecer el objetivo de ataque
      return;
    }
  }
  // Si no se hizo clic en un edificio, el objetivo de ataque se vuelve nulo
  attackTarget = null;
}

class Troop {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float maxSpeed = 6;
  float size = 15;
  float desiredSeparation = 30; // Distancia mínima entre tropas

  Troop(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  // Mover el líder con el mouse
  void update() {
    if (mousePressed && attackTarget == null) {
      PVector desired = new PVector(mouseX, mouseY);
      PVector steer = PVector.sub(desired, position);
      steer.limit(maxSpeed);
      acceleration.add(steer);
    } else if (attackTarget != null) {
      PVector desired = PVector.sub(attackTarget, position);
      desired.setMag(maxSpeed);
      float d = dist(position.x, position.y, attackTarget.x + 75, attackTarget.y + 75);

      // Evitar atravesar el edificio
      if (d < 75) {
        PVector repulse = PVector.sub(position, attackTarget);
        repulse.setMag(maxSpeed);
        acceleration.add(repulse);
      } else {
        PVector steer = PVector.sub(desired, velocity);
        steer.limit(0.1); // Limitar la fuerza
        acceleration.add(steer);
      }
    } else {
      acceleration.mult(0);
    }

    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);

    acceleration.mult(0); // Resetear la aceleración
  }

  // Seguir al líder manteniendo la formación y evitando amontonamientos
  void follow(Troop leader, ArrayList<Troop> followers, PVector target) {
    if (target == null) {
      // Si no hay objetivo de ataque
      PVector desired = PVector.sub(leader.position, position);
      desired.setMag(maxSpeed);

      // Mantener una distancia detrás del líder
      float distance = size + 10; // Distancia fija
      desired.add(PVector.fromAngle(PI)); // Apuntar hacia atrás
      desired.setMag(maxSpeed);

      PVector steer = PVector.sub(desired, velocity);
      steer.limit(0.1); // Limitar la fuerza
      acceleration.add(steer);

      // Comportamiento de separación
      PVector separationForce = new PVector(0, 0);
      for (Troop other : followers) {
        if (other != this) {
          PVector diff = PVector.sub(position, other.position);
          float d = diff.mag();
          if (d < desiredSeparation) {
            diff.normalize(); // Normalizar el vector
            diff.div(d); // Inversamente proporcional a la distancia
            separationForce.add(diff);
          }
        }
      }

      // Aplicar la fuerza de separación
      if (separationForce.mag() > 0) {
        separationForce.normalize();
        separationForce.mult(maxSpeed); // Ajustar la fuerza a la velocidad máxima
        acceleration.add(separationForce);
      }
    } else {
      // Si hay un objetivo de ataque
      PVector desired = PVector.sub(target, position);
      desired.setMag(maxSpeed);

      // Evitar atravesar el edificio
      float d = dist(position.x, position.y, attackTarget.x + 75, attackTarget.y + 75);
      if (d < 75) {
        PVector repulse = PVector.sub(position, attackTarget);
        repulse.setMag(maxSpeed);
        acceleration.add(repulse);
      } else {
        PVector steer = PVector.sub(desired, velocity);
        steer.limit(0.1); // Limitar la fuerza
        acceleration.add(steer);
      }
    }
  }
  void display2() {
    fill(255);
    stroke(0);
    strokeWeight(1);
    ellipse(position.x, position.y, size, size);
  }
  
  // Dibujar la tropa
  void display() {//este display me tira null pointer exception
    int imgIndex = floor(followerAnimationIndex); // Obtener el índice de imagen actual

    // Determinar si el seguidor se mueve a la derecha o a la izquierda
    boolean movingRight = velocity.x > 0; // Se mueve a la derecha si la velocidad es positiva
   
    image(followerImagesLeft[imgIndex], position.x, position.y, 70, 70); // Dibuja la imagen del seguidor
  }
}
