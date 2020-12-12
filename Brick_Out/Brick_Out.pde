Brick[][] brick=new Brick[20][20]; 
PImage back_g;
PImage heart;
PVector speed,location;
float rata_crestere_viteza=0;
int vit_frame=180;
float x=325;
int lives=3;
boolean launched;
boolean a,d;
int bricks=0;
void setup(){
  //noCursor();
  size(800,700);
  back_g=loadImage("fundal.jpg");
  heart=loadImage("heart.png");
  textSize(64);
  
  int i,j,k,l;
  l=75;
  for(i=1;i<=6;i++){
    k=40;
    for(j=1;j<=8;j++){
      brick[i][j]=new Brick(k,l);
      k=k+90;
    }
    l=l+50;
  }
  
  a=d=false;
  launched=false;
  location=new PVector(x+75,657.50);
  speed=new PVector(1,-1);
  frameRate(vit_frame);
}
void draw(){
  image(back_g,0,0);
  Display_b();
  life();
  ball(); 
  placa();
  wall();
  game();
  end();
}
void ball(){
  if(launched==false)
    location.x=x+75;
  else
    location.add(speed); 
  
  if(a)
    x--;
  if(d)
    x++;
  if(x<-50)
    x=-50;
  if(x>700)
    x=700;
  
  pushMatrix();
  fill(#F6FF83);
  translate(location.x,location.y);
  ellipse(0,0,25,25);
  popMatrix();
}
void wall(){
  if(location.x-12.5<=0 || location.x+12.5>=width)
    speed.x=-speed.x;
  if(location.y-12.5<=0)
    speed.y=-speed.y;
  if(location.y-12.5>=height){
    lives--;
    if(lives>0){
      a=d=false;
      launched=false;
      location.x=x+75;
      location.y=657.5;
    }  
  }
}
void placa(){
  pushMatrix();
  fill(255);
  translate(x,670.1);
  rect(0,0,150,20);
  popMatrix();
  
  if(location.x+12.5>=x && location.x-12.5<=x+150 && location.y+12.5>670 && launched){// && location.y+12.5<=675){
    speed.y=-speed.y;
    if(launched)
      if(location.x<=x+75)
        speed.x=-1;
      else
        speed.x=1;
    /*if(launched){
      if(speed.x>0)
        speed.x+=random(rata_crestere_viteza);
      else
        speed.x-=random(rata_crestere_viteza); */
    
  }
  if(location.x+12.5>=x && location.x-12.5<=x+150 && location.y+12.5>675 && launched)
    speed.x=-speed.x;                                      
}
void life(){
  int k=0;
  for(int i=1;i<=lives;i++){
    image(heart,k,0,50,50);
    k=k+50;
  }
}
void game(){
  int i,j;
  for(i=1;i<=6;i++){
    for(j=1;j<=8;j++)
      if(brick[i][j].alive){ //&&(brick[i][j].x==location.x+12.5 || brick[i][j].x+80==location.x+12.5 || brick[i][j].y==location.y+12.5 || brick[i][j].y+40==location.y+12.5)){
        brick[i][j].hit();
        Display_b();
        
    }
    if(i%3==0)
      ball(); 
  }
}
void end(){
  if(lives==0){
    fill(255);
    text("Ai pierdut!",250,600);
    noLoop();
  }
  if(bricks==6*8){
    fill(255);
    text("Ai castigat!",250,600);
    noLoop();
  }
}
void Display_b(){
  int i,j;
  for(i=1;i<=6;i++)
    for(j=1;j<=8;j++)
      if(brick[i][j].alive)
        brick[i][j].display();
}
void keyPressed(){
  if(key=='a' || key=='A'){
    a=true;
    if(launched==false)
      speed.x=-1;
  }
  if(key=='d' || key=='D'){
    d=true;
    if(launched==false)
      speed.y=1;
  }
  if(key==' ')
    launched=true;
}
void keyReleased(){
  if(key=='a' || key=='A')
    a=false;
  if(key=='d' || key=='D')
    d=false;
}
