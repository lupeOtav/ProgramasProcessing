class Personaje {
  PImage sprite;
  int sectionHeight;  // Altura de cada franja
  int currentSection = 0;  // Sección actual donde se aplicará el filtro
  int direction = 1;  // Dirección del efecto (sube o baja)
  int x;
  int y;

  Personaje(String archivo, int posx, int posy) {
    sprite = loadImage(archivo);
    sectionHeight = sprite.height / 8;
    x = posx;
    y = posy;
  }

  void mostrar() {
    image(sprite, x, y);
    applyFilterToSection(currentSection);
  }

  void applyFilterToSection(int section) {
    int yStart = y + section * sectionHeight;

    // Copia la sección original para manipularla
    PImage temp = createImage(sprite.width, sectionHeight, ARGB);
    temp.copy(sprite, 0, section * sectionHeight, sprite.width, sectionHeight, 0, 0, sprite.width, sectionHeight);

    // Aplica el filtro a la copia de la sección
    temp.filter(INVERT);

    // Dibuja la sección filtrada en la posición correspondiente
    image(temp, x, yStart);
  }

  void updateSection() {
    if (frameCount % 5 == 0) {
      currentSection += direction;

      if (currentSection >= sprite.height / sectionHeight || currentSection < 0) {
        direction *= -1;  // Cambia la dirección
        currentSection += direction;  // Asegúrate de que no se salga de los límites
      }
    }
  }
}
