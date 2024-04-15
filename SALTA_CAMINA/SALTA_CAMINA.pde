PImage personaje, fondo1;
float gravity = 1;
float personajeX = 0;
float personajeY = 420;
float ySpeed = 0;
float xSpeed = 8;
float jumpForce = 20;
boolean grounded;
boolean teclaA=false;
boolean teclaD=false;
boolean barraEspaciadora=false;

void setup() {
  size(768, 432);
  fondo1 = loadImage("1recursos.jpg");
  personaje = loadImage("jengibre.png");
}

void draw() {
  background(220);
  image(fondo1, 0, 0, width, height);

if(teclaA) {
    // Tecla 'a'
    personajeX = personajeX - xSpeed;
    teclaA=false;
  } 
  if (teclaD) {
    // Tecla 'd'
    personajeX = personajeX + xSpeed;
    teclaD=false;
  }
  
  
  grounded = personajeY == height - personaje.height;
  image(personaje, personajeX, personajeY + 300, 100, 100);

  if ( barraEspaciadora && grounded) {
    ySpeed = -jumpForce;
    barraEspaciadora=false;
    
  } else {
    ySpeed += gravity;
  }

  personajeY += ySpeed;
  personajeY = min(personajeY, height - personaje.height);
}

void keyPressed() {
  if (keyCode  == 65) {
    // Tecla 'a'
    teclaA=true;
  } else if (keyCode  == 68) {
    // Tecla 'd'
    teclaD=true;
  }

  if ( keyCode  == 32) {
    barraEspaciadora =true;
  } else {
   barraEspaciadora=false;
  }
}
