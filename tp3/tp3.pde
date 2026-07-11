//garcia mateo comision 3
//video https://youtu.be/Hj8X48rlITI?si=2RW6nHI-RJgie4aJ
int niveles = 9;
PImage referencia;

void setup() {
  size(800, 400);
  rectMode(CENTER);
  referencia = loadImage("imagen1.jpg");
}

void draw() {
  background(20);

  // imagen
  if (referencia != null) {
    image(referencia, 0, 0, 400, 400);
  }

  // ENERGÍA ACTIVADA DERECHA
  float energia = map(mouseX, 400, width, 0, 1);
  energia = constrain(energia, 0, 1);

  // Obra
  dibujarCuadranteInteractivo(500, 100, 200, 200, niveles,
    color(2, 74, 47), color(100, 255, 170), energia);

  dibujarCuadranteInteractivo(700, 100, 200, 200, niveles,
    color(200, 0, 30), color(255, 170, 190), energia);

  dibujarCuadranteInteractivo(500, 300, 200, 200, niveles,
    color(76, 40, 33), color(223, 189, 1), energia);

  dibujarCuadranteInteractivo(700, 300, 200, 200, niveles,
    color(78, 39, 132), color(200, 190, 255), energia);
}

// funcion retorno
float calcularTamano(int i, int cant, float tamMax) {
  return map(i, 0, cant - 1, tamMax, 10);
}

// propia
void dibujarCuadranteInteractivo(float x, float y, float w, float h,
                                 int cant, color c1, color c2,
                                 float energia) {

  pushMatrix();
  translate(x, y);

  // Obra en reposo
  if (energia <= 0.01) {

    noStroke();

    for (int i = 0; i < cant; i++) {

      float tam = calcularTamano(i, cant, w);
      float inter = map(i, 0, cant - 1, 0, 1);

      fill(lerpColor(c1, c2, inter));
      rect(0, 0, tam, tam);
    }

    popMatrix();
    return;
  }

  // Efecto progresivo
  float rotBase = energia * 1.2;

  // for anidados
  for (int i = 0; i < cant; i++) {

    for (int j = 0; j < 2; j++) {

      float tam = calcularTamano(i, cant, w);
      float inter = map(i, 0, cant - 1, 0, 1);

      float wave = sin(frameCount * 0.02 + i + j) * 3 * energia;

      pushMatrix();

      rotate(rotBase * i * 0.12);

      fill(lerpColor(c1, c2, inter));

      rect(wave + j, wave + j, tam, tam);

      popMatrix();
    }
  }

  popMatrix();
}

// teclado
void keyPressed() {

  if (key == '+' || key == '=') {
    niveles = min(niveles + 1, 30);
  }
  else if (key == '-') {
    niveles = max(niveles - 1, 5);
  }
  else if (key == 'r' || key == 'R') {
    niveles = 10;
  }
}

// mouse
void mousePressed() {

  if (mouseButton == LEFT) {
    niveles = int(random(8, 25));
  }
}
