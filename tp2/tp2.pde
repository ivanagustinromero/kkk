//ivan romero 119131/3
//comison 1

PImage portada;
PImage personajes;
PImage creditos;
PImage fin;



PFont fuente;

String textoPortada;
String textoPersonajes;
String textoCreditos;


int estado;
int mov;
int seg;
int py;
color botonNN;
color botonAA;
void setup(){
 
  size(640, 480);
  portada = loadImage("portada.jpg");
  personajes = loadImage("personajes.jpg");
  creditos = loadImage("creditos.jpg");
  fin = loadImage("fin.jpg");
  

  
 //fuente
  fuente=loadFont("ComicBold.vlw");
//variables
  estado = 0;
  mov=480;
  seg=0;
  py=0;
  //boton de boquita
  botonNN = color(255,255,0);
  botonAA = color(0,0,255);
//textos
  textoPortada=("Soutk park es una serie animada que trata sobre un grupo de amigos y el pueblo donde reciden\n en el cual siempre pasan cosas extraordinarias y viven muchas aventuras comicas a lo largo de su niñez.");
  textoPersonajes=("Los principales personajes de esta serie son Stan Marsh, Eric Cartman, y Kily Broflvoski y Kenny McCormick doblados por Patricia Azan y Eduardo Garza, entre los dos se dividen a estos cuatro personajes");
  textoCreditos=("Creada por Trey Parker, Matt Stone y Vernon Chatman como una burla hacia toda la gente y cultura del mundo, su objetivo segun los creadores es ofender a toda la gente posible haciendo que esta serie sea un gran escandalo, cuenta con 24 temporadas la cual la ultima salio en 2023 y se esperan mas temporadas proximamente. ");
  
}

void draw(){
  
  //intro
  if (estado == 0){
    image(portada,0,0,640,480); 
    noStroke();
    fill(0,0,0,0);
  rect(0,0,640,480);
    textAlign(CENTER,CENTER);
    if(mouseY>240 & mouseY<260 & mouseX>270 & mouseX<370 & estado == 0){
      fill(botonAA);
    }else{
      fill(botonNN);
    }
    textFont(fuente);
    text("inicio",340,240);
    
  //intro
  }else if(estado== 1){
    //Fondo
    image(portada,0,0,640,480);
    
   
    
   
    
   //PORTADA
    textFont(fuente);
    textSize(40);
    fill(0,255,0);
    textFont(fuente);
    textAlign(CENTER,CENTER);
    
    text(textoPortada,100,mov,400,480);
    if(mov >40){
      mov --;
    }
   
    else if(mov <= 320 & seg<400){
      seg++;
    }else if(seg >= 400){
      estado=2;
      seg=0;
    }
    
  //Personajes
  }else if(estado==2){
    image(personajes,0,0,640,480);
    
    textFont(fuente);
    fill(0,0,0,150);
    noStroke();
    textFont(fuente);
    textAlign(LEFT, CENTER);
   float tono = map(py, height, 100, 255, 0);
  fill(255,255,0,tono);
    if(py < 400){
      py++;
    }
    text(textoPersonajes,150,20,400,500);
    if(py >= 100 & seg < 300){
     seg++;
    }else if(seg >=300){
      estado=3;
      seg=0;
      mov=640;
    }
    
  //Pantalla 3
  }else if(estado == 3){
    image(creditos,0,0,640,480);
    
    textFont(fuente);
    textSize(40);
    fill(255);
    textAlign(CENTER, CENTER);
    
    
  
    fill(0,0,0,150);
    noStroke();
    rect(0,0,640,340); 
    
    
    textFont(fuente);
    fill(255,0,0);
    textAlign(LEFT, CENTER);
    text(textoCreditos,mov,240);
    if(mov> -4500){
      mov=mov-2;
    }else if(mov <= -4500){
      estado= 4;
    }
  }
  
  // final
  else{
    
    image(fin,0,0,640,480);
    noStroke();
    fill(0,0,0,200);
    rect(0,0,640,480);
    
    textAlign(CENTER,CENTER);
    //boton
    if(mouseY>330 & mouseY<360 & mouseX>270 & mouseX<370 & estado== 4){
      fill(botonAA);
    }else{
      fill(botonNN);
    }
    textFont(fuente);
    text("Reiniciar",320,340);
    
  }
  

}

void mousePressed(){
  if(mouseY>240 & mouseY<260 & mouseX>270 & mouseX<370 & estado == 0){
    estado=1;
  }else if(mouseY>330 & mouseY<360 & mouseX>270 & mouseX<370 & estado == 4){
    estado=1;
    mov=480;
    seg=0;
   py=0;
  }
}
