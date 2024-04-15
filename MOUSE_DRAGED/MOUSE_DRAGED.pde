int posX = 100;
int posY = 100;
int posX2 = 150;
int posY2 = 100;
int rectSeleccionado = 1;

void setup() {
  size(400, 400);
}

void draw() {
  background(220);
  fill(255);
  rect(200, 100, 100, 200);
  if(posX>200 && posX<300 && posY>100 && posY<300){
    fill(255, 0, 0);
  }else{
    fill(0,255,0);
  }
 
  rect(posX, posY, 40, 40);
  fill(255, 255, 0);
  rect(posX2, posY2, 40, 40);
}
void mousePressed(){
  if(mouseX>posX2 && mouseX <posX2 +40 && mouseY>posY2 && mouseY< posY2 + 40){
     rectSeleccionado=2;
     }
  if(mouseX>posX && mouseX <posX +40 && mouseY>posY && mouseY< posY + 40){
     rectSeleccionado=1;
     }
}
void mouseDragged() {
  if (rectSeleccionado == 1) {
    posX = mouseX;
    posY = mouseY;
  } else {
    posX2 = mouseX;
    posY2 = mouseY;
  }
}
