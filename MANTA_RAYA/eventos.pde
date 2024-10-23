void keyPressed() {
  if (keyCode==32) {//barra espaciadora
    if (sonido.isPlaying()) {
      sonido.pause();
    } else {

      sonido.play();
      sonido.amp(0.4);//establece el volumen de la musica, entre 0 y 1
    }
  } else if  (keyCode == 10) {//tecla enter
    muerto = false;
  }
}

void mousePressed() {
  sonarActivo = true;
  s = 0;
  if (mouseX>500 && mouseX<590 && mouseY>10 && mouseY<30) {
    mostrarBoundingBox = !mostrarBoundingBox;
  }
}
