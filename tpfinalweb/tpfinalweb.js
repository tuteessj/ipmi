let pantalla = 0;

let desayuno = false;
let estudio = false;
let transporte = "";
let llegoTarde = false;
let examenBien = false;

let imagenes = [];

function preload() {
  imagenes[0] = loadImage("assets/despertador.jpg");
  imagenes[1] = loadImage("assets/dormitorio.jpg");
  imagenes[2] = loadImage("assets/desayuno.jpg");
  imagenes[3] = loadImage("assets/camino.jpg");
  imagenes[4] = loadImage("assets/facultad.jpg");
  imagenes[5] = loadImage("assets/aula.jpg");
  imagenes[6] = loadImage("assets/examen.jpg");
  imagenes[7] = loadImage("assets/final_bien.jpg");
  imagenes[8] = loadImage("assets/final_regular.jpg");
  imagenes[9] = loadImage("assets/final_mal.jpg");
  
  imagenes[10] = loadImage("assets/transporte.jpg");
  imagenes[11] = loadImage("assets/charla.jpg");
  imagenes[12] = loadImage("assets/entregando.jpg");
}

function setup() {
  createCanvas(800, 450);
  textFont("Arial");
}

function draw() {
  background(20);
  dibujarPantalla();

  if (pantalla === 16) {
    dibujarCreditos();
  }
}

function dibujarPantalla() {
  switch (pantalla) {
    case 0:
      mostrarEscena(
        0,
        "SUENA EL DESPERTADOR",
        "Hoy tenés que ir a la facultad a rendir un examen.",
        [
          { texto: "LEVANTARME", accion: "levantarme" },
          { texto: "POSPONER LA ALARMA", accion: "posponer" }
        ]
      );
      break;

    case 1:
      mostrarEscena(
        1,
        "TE LEVANTASTE",
        "Todavía tenés algo de tiempo antes de salir.",
        [
          { texto: "DESAYUNAR", accion: "desayunar" },
          { texto: "NO DESAYUNAR", accion: "noDesayunar" }
        ]
      );
      break;

    case 2:
      mostrarEscena(
        2,
        "DESAYUNÁS",
        "Comés algo rápido y te preparás para salir.",
        [
          { texto: "REPASAR APUNTES", accion: "repasar" },
          { texto: "SALIR DIRECTAMENTE", accion: "salir" }
        ]
      );
      break;

    case 3:
      mostrarEscena(
        2,
        "NO DESAYUNÁS",
        "No tenés hambre o simplemente preferís salir rápido.",
        [
          { texto: "SALIR A LA FACULTAD", accion: "salir" }
        ]
      );
      break;

    case 4:
      mostrarEscena(
        1,
        "CINCO MINUTOS MÁS...",
        "Cerrás los ojos pensando que todavía tenés tiempo.",
        [
          { texto: "DESPERTARME", accion: "despertarTarde" }
        ]
      );
      break;

    case 5:
      mostrarEscena(
        1,
        "¡TE DESPERTASTE TARDE!",
        "Mirás la hora y te das cuenta de que vas bastante justo.",
        [
          { texto: "IR IGUAL", accion: "irTarde" },
          { texto: "NO IR", accion: "noIr" }
        ]
      );
      break;

    case 6:
      mostrarEscena(
        3,
        "SALÍS DE CASA",
        "Agarrás la mochila y cerrás la puerta.",
        [
          { texto: "MOTO", accion: "moto" },
          { texto: "COLECTIVO", accion: "colectivo" },
          { texto: "CAMINANDO", accion: "caminando" }
        ]
      );
      break;

    case 7:
      let mensaje = "";
      if (transporte === "moto") {
        mensaje = "Vas rápido, pero encontrás bastante tránsito.";
      }
      if (transporte === "colectivo") {
        mensaje = "El colectivo tarda más de lo esperado.";
      }
      if (transporte === "caminando") {
        mensaje = "Vas caminando y repasás mentalmente lo que estudiaste.";
      }

      mostrarEscena(
        10,
        "CAMINO A LA FACULTAD",
        mensaje,
        [
          { texto: "CONTINUAR", accion: "llegarFacu" }
        ]
      );
      break;

    case 8:
      mostrarEscena(
        4,
        "LLEGASTE A LA FACULTAD",
        "Hay compañeros esperando afuera del aula.",
        [
          { texto: "HABLAR CON UN COMPAÑERO", accion: "hablar" },
          { texto: "IR DIRECTO AL AULA", accion: "aula" }
        ]
      );
      break;

    case 9:
      mostrarEscena(
        11,
        "UN COMPAÑERO TE PREGUNTA",
        "\"¿Estudiaste para el examen?\"",
        [
          { texto: "SÍ, ESTUDIÉ", accion: "estudie" },
          { texto: "LA VERDAD QUE NO", accion: "noEstudie" }
        ]
      );
      break;

    case 10:
      mostrarEscena(
        5,
        "ENTRÁS AL AULA",
        "El profesor reparte los exámenes.",
        [
          { texto: "REPASAR UNA VEZ MÁS", accion: "repasoFinal" },
          { texto: "ESPERAR TRANQUILO", accion: "esperar" }
        ]
      );
      break;

    case 11:
      mostrarEscena(
        6,
        "EMPIEZA EL EXAMEN",
        "Das vuelta la hoja y aparece una pregunta bastante difícil.",
        [
          { texto: "INTENTAR RESOLVERLA", accion: "resolver" },
          { texto: "SALTARLA Y SEGUIR", accion: "saltar" }
        ]
      );
      break;

    case 12:
      if (llegoTarde || !estudio) {
        mostrarEscena(
          12,
          "EXAMEN TERMINADO",
          "Entregás la hoja. No estás seguro de cómo te fue.",
          [
            { texto: "VER RESULTADO", accion: "resultado" }
          ]
        );
      } else {
        mostrarEscena(
          12,
          "EXAMEN TERMINADO",
          "Entregás la hoja. Sentís que pudiste responder bastante bien.",
          [
            { texto: "VER RESULTADO", accion: "resultado" }
          ]
        );
      }
      break;

    case 13:
      mostrarFinal(
        7,
        "FINAL 1 — DÍA PERFECTO",
        "¡Aprobaste con nota alta! Salís de la facultad sabiendo que el examen salió bien.",
        "Por una vez, todo salió como esperabas."
      );
      break;

    case 14:
      mostrarFinal(
        8,
        "FINAL 2 — SOBREVIVÍ",
        "Aprobaste con lo justo. Fue un estrés total, pero ya está.",
        "Perdiste años de vida, pero podés respirar."
      );
      break;

    case 15:
      mostrarFinal(
        9,
        "FINAL 3 — UN DESASTRE",
        "O te quedaste dormido, o desaprobaste por completo.",
        "Vas a tener que estudiar el doble para el recuperatorio."
      );
      break;
  }
}

function mostrarEscena(indiceImagen, titulo, descripcion, opciones) {
  if (imagenes[indiceImagen]) {
    image(imagenes[indiceImagen], 0, 0, width, height);
  } else {
    background(40);
  }

  fill(0, 150);
  rect(0, 0, width, height);

  fill(255);
  textAlign(CENTER);
  textSize(32);
  text(titulo, width / 2, 55);

  textSize(20);
  text(descripcion, width / 2, 100, 650);

  crearBotones(opciones);
}

function crearBotones(opciones) {
  let ancho = 240;
  let alto = 55;
  let separacion = 20;

  let total = opciones.length * ancho + (opciones.length - 1) * separacion;
  let inicioX = (width - total) / 2;

  for (let i = 0; i < opciones.length; i++) {
    let x = inicioX + i * (ancho + separacion);
    let y = 330;

    fill(255);
    rect(x, y, ancho, alto, 12);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(17);
    text(opciones[i].texto, x + ancho / 2, y + alto / 2);
  }
}

function mostrarFinal(indiceImagen, titulo, descripcion, frase) {
  if (imagenes[indiceImagen]) {
    image(imagenes[indiceImagen], 0, 0, width, height);
  }

  fill(0, 160);
  rect(0, 0, width, height);

  fill(255);
  textAlign(CENTER);

  textSize(34);
  text(titulo, width / 2, 75);

  textSize(21);
  text(descripcion, width / 2, 145, 650);

  textSize(18);
  text(frase, width / 2, 220, 600);

  fill(255);
  rect(150, 320, 240, 55, 12);
  fill(0);
  textSize(18);
  text("VOLVER AL INICIO", 270, 347);

  fill(255);
  rect(410, 320, 240, 55, 12);
  fill(0);
  textSize(18);
  text("VER CRÉDITOS", 530, 347);
}

function dibujarCreditos() {
  fill(0, 180);
  rect(0, 0, width, height);

  fill(255);
  textAlign(CENTER);

  textSize(30);
  text("CRÉDITOS", width / 2, 80);

  textSize(20);
  text("Mateo García,Abril Sanabria", width / 2, 140);
  text("Programación para Medios Interactivos", width / 2, 180);
  text("Aventura gráfica interactiva", width / 2, 220);

  let movimiento = sin(frameCount * 0.05) * 20;

  textSize(40);
  text("★", width / 2 + movimiento, 290);

  fill(255);
  rect(280, 345, 240, 50, 10);

  fill(0);
  textSize(17);
  text("VOLVER AL INICIO", width / 2, 370);
}

function mousePressed() {
  if (pantalla === 0) {
    if (mouseDentro(150, 330, 240, 55)) {
      pantalla = 1;
    } else if (mouseDentro(410, 330, 240, 55)) {
      pantalla = 4;
    }
  }
  else if (pantalla === 1) {
    if (mouseDentro(150, 330, 240, 55)) {
      desayuno = true;
      pantalla = 2;
    } else if (mouseDentro(410, 330, 240, 55)) {
      desayuno = false;
      pantalla = 3;
    }
  }
  else if (pantalla === 2) {
    if (mouseDentro(150, 330, 240, 55)) {
      estudio = true;
      pantalla = 6;
    } else if (mouseDentro(410, 330, 240, 55)) {
      estudio = false;
      pantalla = 6;
    }
  }
  else if (pantalla === 3) {
    if (mouseDentro(280, 330, 240, 55)) {
      pantalla = 6;
    }
  }
  else if (pantalla === 4) {
    if (mouseDentro(280, 330, 240, 55)) {
      pantalla = 5;
      llegoTarde = true;
    }
  }
  else if (pantalla === 5) {
    if (mouseDentro(150, 330, 240, 55)) {
      pantalla = 6;
    } else if (mouseDentro(410, 330, 240, 55)) {
      pantalla = 15;
    }
  }
  else if (pantalla === 6) {
    if (mouseDentro(70, 330, 200, 55)) {
      transporte = "moto";
      pantalla = 7;
    } else if (mouseDentro(300, 330, 200, 55)) {
      transporte = "colectivo";
      pantalla = 7;
    } else if (mouseDentro(530, 330, 200, 55)) {
      transporte = "caminando";
      pantalla = 7;
    }
  }
  else if (pantalla === 7) {
    if (mouseDentro(280, 330, 240, 55)) {
      pantalla = 8;
    }
  }
  else if (pantalla === 8) {
    if (mouseDentro(150, 330, 240, 55)) {
      pantalla = 9; 
    } else if (mouseDentro(410, 330, 240, 55)) {
      pantalla = 10;
    }
  }
  else if (pantalla === 9) {
    if (mouseDentro(150, 330, 240, 55) || mouseDentro(410, 330, 240, 55)) {
      pantalla = 10;
    }
  }
  else if (pantalla === 10) {
    if (mouseDentro(150, 330, 240, 55) || mouseDentro(410, 330, 240, 55)) {
      pantalla = 11;
    }
  }
  else if (pantalla === 11) {
    if (mouseDentro(150, 330, 240, 55)) {
      examenBien = true;
    } else if (mouseDentro(410, 330, 240, 55)) {
      examenBien = false;
    }
    pantalla = 12;
  }
  else if (pantalla === 12) {
    if (mouseDentro(280, 330, 240, 55)) {
      if (estudio && !llegoTarde && examenBien) {
        pantalla = 13;
      } else {
        pantalla = 14; 
      }
    }
  }
  else if (pantalla === 13 || pantalla === 14 || pantalla === 15) {
    if (mouseDentro(150, 320, 240, 55)) {
      reiniciarJuego(); 
    } else if (mouseDentro(410, 320, 240, 55)) {
      pantalla = 16;
    }
  }
  else if (pantalla === 16) {
    if (mouseDentro(280, 345, 240, 50)) {
      reiniciarJuego();
    }
  }
}

function mouseDentro(x, y, ancho, alto) {
  return (
    mouseX > x &&
    mouseX < x + ancho &&
    mouseY > y &&
    mouseY < y + alto
  );
}

function reiniciarJuego() {
  pantalla = 0;
  desayuno = false;
  estudio = false;
  transporte = "";
  llegoTarde = false;
  examenBien = false;
}
