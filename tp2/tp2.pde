// MODO DIABLO - PRESENTACION FINAL
// GARCIA MATEO NICOLAS COMISION 3 LEGAJO 46196438

// IMAGENES
PImage img1, img2, img3, img4, img5;
PImage img6, img7, img8, img9, img10;

// FUENTES
PFont fuenteTitulo;
PFont fuenteTexto;
PFont fuenteTexto1;

// VARIABLES
int pantalla = 0;

int tiempoCambio = 12000;
int ultimoCambio = 0;

float fade = 0;
float moverX = -400;
float zoom = 10;
float bajarY = -150;
float rotacion = -1;

boolean iniciar = false;



void reiniciarAnimaciones() {

  fade = 0;
  moverX = -400;
  zoom = 10;
  bajarY = -150;
  rotacion = -1;
}



void setup() {

  size(640, 480);

  // FUENTES
  fuenteTitulo = loadFont("Kelsi1-fill-48.vlw");
  fuenteTexto = loadFont("MicrosoftNewTaiLue-Bold-48.vlw");
  fuenteTexto1 = loadFont("Arial-Black-48.vlw");

  // IMAGENES
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
  img6 = loadImage("6.png");
  img7 = loadImage("7.png");
  img8 = loadImage("8.png");
  img9 = loadImage("9.png");
  img10 = loadImage("10.png");
}



void draw() {

  background(0);

  // PANTALLA INICIAL

  if (iniciar == false) {

    image(img1, 0, 0, width, height);

    fill(255, 0, 0);

    textFont(fuenteTitulo);

    textSize(60);

    text("MODO", 250, 90);
    text("DIABLO", 230, 160);

    // PLAY BOTON PARA INICIAR
    fill(255);

    rect(440, 385, 140, 55, 15);

    fill(0);

    // CAMBIO DE FUENTE
    textFont(fuenteTexto1);

    textSize(35);

    text("PLAY", 460, 423);
  }

  // PRESENTACION

  else {

    if (millis() - ultimoCambio > tiempoCambio && pantalla < 9) {

      pantalla++;

      ultimoCambio = millis();

      reiniciarAnimaciones();
    }

    // ANIMACIONES
    if (pantalla < 9) {

      fade += 4;
      moverX += 4;

      if (zoom < 42) {
        zoom += 1;
      }

      bajarY += 3;
      rotacion += 0.02;
    }

    if (fade > 255) fade = 255;

   
    // PAGINA 1
    

    if (pantalla == 0) {

      tint(255, fade);

      image(img1, 0, 0, width, height);

      fill(255, 0, 0, fade);

      textFont(fuenteTitulo);

      textSize(42);

      text("MODO DIABLO", 80, 100);

      textFont(fuenteTexto);

      textSize(16);

      text("Integrantes:", 40, 170);
      text("- Duki", 60, 210);
      text("- YSY A", 60, 245);
      text("- Neo Pistea", 60, 280);

      text("2018", 40, 360);

      text("La influencia de Modo Diablo", 40, 400);
      text("en el trap argentino y", 40, 425);
      text("la musica urbana.", 40, 450);
    }

    // PAGINA 2

    else if (pantalla == 1) {

      image(img2, 0, 0, width, height);

      fill(255);

      textFont(fuenteTitulo);

      textSize(30);

      text("QUE ES", moverX, 60);
      text("MODO DIABLO?", moverX, 110);

      textFont(fuenteTexto);

      textSize(14);

      text("Modo Diablo fue un grupo/banda", 20, 190);
      text("de trap argentino formado", 20, 215);
      text("por Duki, YSY A y Neo Pistea.", 20, 240);

      text("Aparecio alrededor de 2017,", 20, 290);
      text("cuando el trap comenzaba", 20, 315);
      text("a crecer mucho entre", 20, 340);
      text("los jovenes argentinos.", 20, 365);

      text("Representaba una union", 20, 415);
      text("artistica y cultural.", 20, 440);
    }

    // PAGINA 3

    else if (pantalla == 2) {

      image(img3, 0, 0, width, height);

      fill(255);

      textFont(fuenteTitulo);

      textSize(zoom);

      text("TRAP", 220, 70);
      text("ARGENTINO", 120, 120);

      textFont(fuenteTexto);

      textSize(13);

      text("Antes de Modo Diablo ya", 20, 190);
      text("existian competencias", 20, 215);
      text("de freestyle underground.", 20, 240);

      text("El Quinto Escalon ayudo", 20, 290);
      text("a hacer conocidos a", 20, 315);
      text("muchos artistas.", 20, 340);

      text("a duki su primer quinto", 20, 390);
      text("ganado, el premio era una prod gratis", 20, 415);
      text("y saco no vendo trap, su primer track", 20, 440);
    }

    // PAGINA 4

    else if (pantalla == 3) {

      image(img4, 0, 0, width, height);

      fill(255);

      textFont(fuenteTitulo);

      textSize(32);

      text("COMO NACIO", 120, bajarY);
      text("MODO DIABLO?", 90, bajarY + 50);

      textFont(fuenteTexto);

      textSize(13);

      text("El grupo surgio gracias", 20, 210);
      text("a la amistad entre", 20, 235);
      text("YSY A, Duki y Neo.", 20, 260);

      text("Compartian escenarios,", 20, 310);
      text("eventos y canciones.", 20, 335);

      text("se inspiraban mucho en el trap", 20, 385);
      text("de estados unidos, en argentina era muy poco recurrido", 20, 410);
    }

    // PAGINA 5

    else if (pantalla == 4) {

      image(img5, 0, 0, width, height);

      pushMatrix();

      translate(width/2, 70);

      rotate(rotacion);

      fill(255, 0, 0);

      textFont(fuenteTitulo);

      textSize(28);

      text("ANTEZANA 247", -140, 0);

      popMatrix();

      fill(255);

      textFont(fuenteTexto);

      textSize(13);

      text("Fue la casa donde convivieron", 20, 220);
      text("Duki, YSY A y Neo Pistea.", 20, 245);

      text("Es conocida como la", 20, 295);
      text("'cuna del trap argentino'.", 20, 320);

      text("Alli compartian freestyle,", 20, 370);
      text("grabaciones y fiestas.", 20, 395);

      text("fueron de los primeros en hacer", 20, 420);
      text("trap, genero casi no reconocido en esos dias en arg", 20, 445);
    }

    // PAGINA 6

    else if (pantalla == 5) {

      tint(255, fade);

      image(img6, 0, 0, width, height);

      fill(255, fade);

      textFont(fuenteTitulo);

      textSize(40);

      text("DUKI", 220, 70);

      textFont(fuenteTexto);

      textSize(13);

      text("Duki es uno de los artistas", 20, 200);
      text("mas importantes del trap.", 20, 225);

      text("Se hizo conocido gracias", 20, 275);
      text("al freestyle y luego", 20, 300);
      text("inicio su carrera musical.", 20, 325);

      text("Canciones como:", 20, 375);

      text("'No Vendo Trap, Goteo' y", 20, 405);
      text("'She Don't Give a FO'", 20, 430);
    }

    // PAGINA 7

    else if (pantalla == 6) {

      image(img7, 0, 0, width, height);

      fill(255);

      textFont(fuenteTitulo);

      textSize(30);

      text("YSY A Y", moverX, 60);
      text("NEO PISTEA", moverX, 110);

      textFont(fuenteTexto);

      textSize(13);

      text("YSY A fue uno de los", 20, 200);
      text("creadores de El Quinto", 20, 225);
      text("Escalon.", 20, 250);

      text("Neo Pistea fue uno", 20, 300);
      text("de los pioneros del", 20, 325);
      text("trap argentino.", 20, 350);

      text("Ambos aportaron creatividad,", 20, 400);
      text("energia y estilo callejero.", 20, 425);
    }

    // PAGINA 8

    else if (pantalla == 7) {

      image(img8, 0, 0, width, height);

      fill(255);

      textFont(fuenteTitulo);

      textSize(zoom);

      text("ESTILO", 180, 70);
      text("MUSICAL", 150, 120);

      textFont(fuenteTexto);

      textSize(13);

      text("- Beats oscuros", 20, 210);
      text("- Uso de autotune", 20, 235);
      text("- Energia agresiva", 20, 260);
      text("- Estetica urbana", 20, 285);

      text("Canciones importantes:", 20, 340);

      text("'Trap N Export'", 20, 370);
      text("'Tumbando el Club'", 20, 395);
      text("'UH' y 'Xanax'", 20, 420);
    }

    // PAGINA 9

    else if (pantalla == 8) {

      image(img9, 0, 0, width, height);

      fill(255);

      textFont(fuenteTitulo);

      textSize(20);

      text("IMPACTO EN LA MUSICA ARGENTINA", 90, bajarY);
      text("HOY SON DE LOS ARTISTAS MAS ESCUCHADOS", 60, bajarY + 40);

      textFont(fuenteTexto);

      textSize(13);

      text("siendo un genero no reconocido", 20, 210);
      text("supieron llevarlo a jovenes", 20, 235);
      text("todavia no se sabe cuando vuelven", 20, 260);

      text("Muchos comenzaron a", 20, 310);
      text("escuchar trap, improvisar", 20, 335);
      text("y producir musica por ellos", 20, 360);

      text("Cada integrante siguio", 20, 410);
      text("su carrera individual.", 20, 435);
    }

    // PAGINA 10

    else if (pantalla == 9) {

      noTint();

      image(img10, 0, 0, width, height);

      fill(255, 0, 0);

      textFont(fuenteTitulo);

      textSize(40);

      text("MODO DIABLO", 200, 300);

      textFont(fuenteTexto);

      textSize(13);

      text("Modo Diablo fue mucho", 20, 200);
      text("mas que un grupo musical.", 20, 225);

      text("Represento una generacion", 20, 275);
      text("y una nueva forma de", 20, 300);
      text("hacer musica urbana.", 20, 325);

      text("Gracias a Duki, YSY A", 20, 375);
      text("y Neo Pistea, se hizo enorme este movimiento", 20, 400);
      text("llegando al BERNABEU SOLD OUT.", 20, 425);

      // BOTON REINICIAR
      fill(255);

      rect(210, 435, 220, 35, 15);

      fill(0);

      // CAMBIO DE FUENTE
      textFont(fuenteTexto1);

      textSize(18);

      text("REINICIAR", 240, 458);
    }
  }
}

// CLICK

void mousePressed() {

  // BOTON PLAY
  if (iniciar == false &&
    mouseX > 440 &&
    mouseX < 580 &&
    mouseY > 385 &&
    mouseY < 440) {

    iniciar = true;

    ultimoCambio = millis();
  }

  // BOTON REINICIAR
  else if (pantalla == 9 &&
    mouseX > 210 &&
    mouseX < 430 &&
    mouseY > 435 &&
    mouseY < 470) {

    pantalla = 0;

    reiniciarAnimaciones();

    ultimoCambio = millis();
  }
}
