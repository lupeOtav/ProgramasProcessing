import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer musica;
FFT fft;

void setup() {
  size(500, 500, P3D);
  
  minim = new Minim(this);
  musica = minim.loadFile("sabbraCadabra.mp3", 1024);
  musica.loop();
  
  fft = new FFT(musica.bufferSize(), musica.sampleRate());
}

void draw() {
  background(0);
  noStroke();
  fft.forward(musica.mix);
  
  for (int i = 0; i < fft.specSize(); i++) {
    fill(0, random(255), 255);
    rect(i * fft.getBand(i), width - random(20, mouseX), 5, width - fft.getBand(i) * 8);
    fill(random(255), 255, 0);
    rect(height -  random(20, mouseY), i * fft.getBand(i), height - fft.getBand(i) * 8, 7);
  }
}
