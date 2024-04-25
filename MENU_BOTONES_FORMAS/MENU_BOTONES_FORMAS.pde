int boton = 0;
int relleno;
int sobre = 0;
int superior = 0;
boolean borde = false;

void setup() {
  size(400, 400);
  relleno = color(234, 182, 118);
}

void draw() {
  background(220);

  // lateral
  fill(234, 182, 118);
  rect(340, 0, 60, 360);
  strokeWeight(3);
  stroke(255);
  fill(255, 200, 118);
  rect(350, 10, 40, 150);
  rect(350, 180, 40, 150);

  // con relleno y sin borde - superior
  noStroke();
  fill(234, 200, 160);
  rect(0, 0, 340, 60);

  switch(superior) {
    case 1:
      fill(255, 200, 118);
      rect(10, 10, 100, 40);
      fill(226, 135, 67);
      rect(120, 10, 100, 40);
      rect(230, 10, 100, 40);
      break;
    case 2:
      fill(255, 200, 118);
      rect(120, 10, 100, 40);
      fill(226, 135, 67);
      rect(10, 10, 100, 40);
      rect(230, 10, 100, 40);
      break;
    case 3: 
      fill(255, 200, 118);
      rect(230, 10, 100, 40);
      fill(226, 135, 67);
      rect(10, 10, 100, 40);
      rect(120, 10, 100, 40);
      break;
    default:
      fill(226, 135, 67);
      rect(10, 10, 100, 40);
      rect(120, 10, 100, 40);
      rect(230, 10, 100, 40);
      break;
  }

  // con relleno y borde
  noStroke();
  fill(234, 182, 118);
  rect(0, 340, 400, 60);
  strokeWeight(5);
  stroke(226, 135, 67);

  switch(sobre) {
    case 1:
      fill(relleno);
      rect(10, 350, 100, 40);
      break;
    case 2: 
      fill(relleno);
      rect(150, 350, 100, 40);
      break;
    case 3: 
      fill(relleno);
      rect(290, 350, 100, 40);
      break;
  }

  noStroke();
  noFill();

  switch(boton) {
    case 1:
      fill(188, 181, 197);
      break;
    case 2: 
       fill(118, 181, 230);
      break;
    case 3: 
       fill(10, 181, 197);
      break;
  }

  if(borde) {
    strokeWeight(15);
    stroke(155, 155, 100);
  } else {
    noStroke();
  }
  
  switch(superior) {
    case 1:
      ellipse(170, 200, 100, 100);
      break;
    case 2:
      rect(100, 150, 150, 100);
      break;
    case 3:
      ellipse(160, 200, 200, 100);
      break;
  }

  noStroke();

  // texto de los botones
  fill(0);
  text("COLOR1", 20, 370);
  text("COLOR2", 160, 370);
  text("COLOR3", 300, 370);
  
  text("FORMA1", 30, 30);
  text("FORMA2", 140, 30);
  text("FORMA3", 250, 30);

  push();
  translate(200, 200);
  rotate(1.5708);// ROTA EN 90 GRADOS, EL PARAMETRO ESTA EXPRESADO EN RADIANES
  if(borde) {
    fill(255);
    text("STROKE", -140, -160);
    fill(0);
    text("NO STROKE", 20, -160);
  } else {
    fill(0);
    text("STROKE", -140, -160);
    fill(255);
    text("NO STROKE", 20, -160);
  }
  pop();
}

void mousePressed() {
  if(mouseX > 10 && mouseX < 110 && mouseY > 350 && mouseY < 400) {
    boton = 1;
  }
  if(mouseX > 150 && mouseX < 250 && mouseY > 350 && mouseY < 400) {
    boton = 2;
  }
  if(mouseX > 290 && mouseX < 390 && mouseY > 350 && mouseY < 400) {
    boton = 3;
  }
  if(mouseX > 10 && mouseX < 110 && mouseY > 10 && mouseY < 50) {
    superior = 1;
  }
  if(mouseX > 120 && mouseX < 220 && mouseY > 10 && mouseY < 50) {
    superior = 2;
  }
  if(mouseX > 230 && mouseX < 330 && mouseY > 10 && mouseY < 50) {
    superior = 3;
  }
  if(mouseX > 350 && mouseX < 390 && mouseY > 10 && mouseY < 160) {
    borde = true;
  }
  if(mouseX > 350 && mouseX < 390 && mouseY > 180 && mouseY < 330) {
    borde = false;
  }
}

void mouseMoved() {
  if (mouseX > 10 && mouseX < 110 && mouseY > 350 && mouseY < 400) {
    relleno = color(255, 255, 255); // Relleno blanco
    sobre = 1;
  } else if(mouseX > 150 && mouseX < 250 && mouseY > 350 && mouseY < 400) {
    relleno = color(255, 255, 255); // Relleno blanco
    sobre = 2;
  } else if(mouseX > 290 && mouseX < 390 && mouseY > 350 && mouseY < 400) {
    relleno = color(255, 255, 255); // Relleno blanco
    sobre = 3;
  } else {
    relleno = color(234, 182, 118); 
  }
}
