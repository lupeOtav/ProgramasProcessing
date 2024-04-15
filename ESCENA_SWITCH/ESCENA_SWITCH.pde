int escena = 0;
PImage fondo1;
PImage fondo2;

void setup() {
  size(400, 400);
    fondo1 = loadImage("fondo1.jpg");
  fondo2 = loadImage("fondo2.jpg");
}

void draw() {
  background(220);
  switch (escena) {
    case 0:
      escena0();
      break;
    case 1:
      escena1();
      break;
    case 2:
      break;
    case 3:
      break;
  }
  /*
  if(escena == 0){
    image(fondo1,10,10,380,380);
    fill(0,120);
    rect(10,10,380,380);
    fill(255,125,0);
    rect(200,200,100,60);
  }
  if  (escena == 1){
      image(fondo2,10,10,380,380);
        fill(250, 0, 230,120);
    rect(40,40,320,320);
    fill(55,125,0);
    rect(200,200,100,60);
    }
  if(escena == 2)
    {
      
    }
  if(escena == 3)
    {
      
    }*/
}
void escena0(){
      image(fondo1, 10, 10, 380, 380);
      fill(0, 120);
      rect(10, 10, 380, 380);
      fill(255, 125, 0);
      rect(200, 200, 100, 60);
}
void escena1(){
      image(fondo2, 10, 10, 380, 380);
      fill(250, 0, 230, 120);
      rect(40, 40, 320, 320);
      fill(55, 125, 0);
      rect(200, 200, 100, 60);
}
void mousePressed() {
  if (mouseX > 200 && mouseX < 300 && mouseY > 200 && mouseY < 260)   {
    if(escena == 1){
      escena = 0;
    }
    else if(escena == 0){
       escena = 1;
    }
  }
}
