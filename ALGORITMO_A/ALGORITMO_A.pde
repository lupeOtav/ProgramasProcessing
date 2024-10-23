import java.util.Collections;

int cols = 8;
int rows = 8;
Spot[][] grid;
Spot start, end, current;
float w, h;
PImage playerImg, boardImg, swordImg, rockImg;
ArrayList<Spot> openSet = new ArrayList<Spot>();
ArrayList<Spot> closedSet = new ArrayList<Spot>();
ArrayList<Spot> path = new ArrayList<Spot>();
int pathIndex = 0;  // Índice para avanzar en el camino
boolean moving = false;  // Controla si el personaje está en movimiento
boolean showPath = false; // Controla si se muestra el camino
boolean buttonPressed = false; // Controla si el botón fue presionado
int phase = 0; // Fase: 0 = estático, 1 = mostrar camino, 2 = mover personaje, 3 = reiniciar

void setup() {
  size(400, 400);
  w = width / cols;
  h = height / rows;

  // Cargar las imágenes
  playerImg = loadImage("chicader.png");
  boardImg = loadImage("tablero.jpg");
  swordImg = loadImage("p11.png");
  rockImg = loadImage("B5.png");

  resetGrid();  // Inicializar la grilla
}

void draw() {
  background(255);
  image(boardImg, 0, 0, width, height); // Tablero

  // Dibujar las casillas
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].show(color(255));
    }
  }

  // Dibujar obstáculos
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (grid[i][j].wall) {
        image(rockImg, grid[i][j].i * w, grid[i][j].j * h, w, h);
      }
    }
  }

  // Dibujar la espada
  image(swordImg, end.i * w, end.j * h, w, h);

  // Mostrar el camino si está en la fase de mostrar el camino
  if (showPath) {
    noFill();
    stroke(255, 0, 200);
    strokeWeight(w / 2);
    beginShape();
    for (Spot spot : path) {
      vertex(spot.i * w + w / 2, spot.j * h + h / 2);
    }
    endShape();
  }

  // Mover el personaje si está en la fase de movimiento
  if (moving && path.size() > 0 && pathIndex < path.size()) {
    // Dibujar el personaje
    Spot spot = path.get(pathIndex);
    image(playerImg, spot.i * w, spot.j * h, w, h);

    // Avanzar al siguiente paso en el camino cada 60 fotogramas (1 segundo)
    if (frameCount % 60 == 0) {
      pathIndex++;
    }
  } else if (pathIndex >= path.size() && moving) {
    println("Llegó a la espada!");
    noLoop();  // Detener una vez que llega al destino
  }

  // Dibujar el botón
  drawButton();
}

void drawButton() {
  fill(150);
  noStroke();
  rect(10, height - 50, 150, 40);
  fill(255);

  textSize(20);
  textAlign(CENTER, CENTER);
  text("Mostrar camino", 10 + 75, height - 50 + 20); // Centro del botón
  if (buttonPressed) {
    handleButtonPress();
    buttonPressed = false; // Resetear el botón después de presionar
  }
}

void mousePressed() {
  // Comprobar si el mouse está sobre el botón
  if (mouseX > 10 && mouseX < 160 && mouseY > height - 50 && mouseY < height - 10) {
    buttonPressed = true; // Cambiar el estado del botón al presionar
  }
}

void resetGrid() {
  // Reiniciar variables
  grid = new Spot[cols][rows];
  openSet.clear();
  closedSet.clear();
  path.clear();
  pathIndex = 0;
  moving = false;
  showPath = false;

  // Crear la grilla
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Spot(i, j);
    }
  }

  // Definir obstáculos (piedras)
  for (int i = 0; i < 10; i++) {
    int x = floor(random(cols));
    int y = floor(random(rows));
    grid[x][y].wall = true;
  }

  // Definir inicio y fin
  start = grid[0][0];
  end = grid[cols - 1][rows - 1];
  openSet.add(start);

  // Conectar los vecinos
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].addNeighbors(grid);
    }
  }
  
  // Resetear la fase
  phase = 0;
}

void handleButtonPress() {
  if (phase == 0) {
    // Fase 0: Encontrar el camino y mostrarlo
    if (findPath()) {
      showPath = true;
      phase = 1;
    }
  } else if (phase == 1) {
    // Fase 1: Comenzar a mover el personaje
    moving = true;
    phase = 2;
  } else if (phase == 2) {
    // Fase 2: Reiniciar el tablero
    resetGrid();  // Generar nuevos obstáculos y un nuevo camino
    phase = 0;
    loop();  // Volver a activar el loop de P5.js si se había detenido
  }
}

// Función para encontrar el camino con A*
boolean findPath() {
  while (openSet.size() > 0) {
    int lowestIndex = 0;
    for (int i = 0; i < openSet.size(); i++) {
      if (openSet.get(i).f < openSet.get(lowestIndex).f) {
        lowestIndex = i;
      }
    }
    current = openSet.get(lowestIndex);

    if (current == end) {
      // Se encontró el camino
      path = new ArrayList<Spot>();
      Spot temp = current;
      path.add(temp);
      while (temp.previous != null) {
        path.add(temp.previous);
        temp = temp.previous;
      }
      Collections.reverse(path);  // Invertimos el camino para que vaya del inicio al final
      return true; // Camino encontrado
    }

    openSet.remove(current);
    closedSet.add(current);

    for (Spot neighbor : current.neighbors) {
      if (!closedSet.contains(neighbor) && !neighbor.wall) {
        float tempG = current.g + 1;
        boolean newPath = false;

        if (openSet.contains(neighbor)) {
          if (tempG < neighbor.g) {
            neighbor.g = tempG;
            newPath = true;
          }
        } else {
          neighbor.g = tempG;
          newPath = true;
          openSet.add(neighbor);
        }

        if (newPath) {
          neighbor.h = heuristic(neighbor, end);
          neighbor.f = neighbor.g + neighbor.h;
          neighbor.previous = current;
        }
      }
    }
  }
  return false; // No se encontró camino
}

// Heurística para A* (aquí usamos la distancia Manhattan)
float heuristic(Spot a, Spot b) {
  return abs(a.i - b.i) + abs(a.j - b.j); // Distancia Manhattan
}

// Clase para cada casilla
class Spot {
  int i, j;
  float f, g, h;
  ArrayList<Spot> neighbors = new ArrayList<Spot>();
  Spot previous;
  boolean wall;

  Spot(int i, int j) {
    this.i = i;
    this.j = j;
    f = 0;
    g = 0;
    h = 0;
    wall = false;
  }

  void addNeighbors(Spot[][] grid) {
    int i = this.i;
    int j = this.j;
    if (i < cols - 1) {
      neighbors.add(grid[i + 1][j]);
    }
    if (i > 0) {
      neighbors.add(grid[i - 1][j]);
    }
    if (j < rows - 1) {
      neighbors.add(grid[i][j + 1]);
    }
    if (j > 0) {
      neighbors.add(grid[i][j - 1]);
    }
  }

  void show(color col) {
    fill(col);
    noStroke();
    rect(i * w, j * h, w, h);
  }
}
