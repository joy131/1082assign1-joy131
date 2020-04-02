PImage bgImg;
PImage groundhog;
PImage life;
PImage robot;
PImage soil;
PImage soldier;

int x; //soldier
int laserX; //Laser
int laserX2;

int laserLength = 40;

int robotPosition_x;
int robotPosition_y;

int soldierY;

void setup() {
  size(640, 480);


bgImg = loadImage("img/bg.jpg");
groundhog = loadImage("img/groundhog.png");
life = loadImage("img/life.png");
soil = loadImage("img/soil.png");
robot = loadImage("img/robot.png");
soldier = loadImage("img/soldier.png");

x = 0; //soldier



robotPosition_x = int(random(100,500));
int y_robotCase = int(random(0,3.99));
int y_soldierCase= int(random(0,3.99));
robotPosition_y =  160 + y_robotCase*80;
soldierY = 160 + y_soldierCase*80;

laserX = robotPosition_x + 25; // Laser point 1

}

void draw() {
  
 //background
image (bgImg, 0, 0); 

//sun

stroke(255,255,0);
strokeWeight(5);
fill(253, 184, 19);
ellipse(590, 50, 120,120); //sun

//grass
noStroke();
fill(124,204,25);
quad(0,145,640,145,640,160,0,160);  

//hog
image (groundhog , 280 , 80); 

// 3 lifes
image (life , 10, 10);
image (life , 80, 10);
image (life , 150, 10); 

//soil
image (soil , 0 , 160); 

//robot
image ( robot , robotPosition_x , robotPosition_y); 


//laser
stroke(255,0,0);
strokeWeight(10);

laserX=laserX-1;
if(laserX<robotPosition_x-100){
laserX = robotPosition_x+25;
}
laserX2 = (laserX + laserLength);
if(laserX2 > robotPosition_x+25)
{
  laserX2 = robotPosition_x+25;
}
line(laserX,robotPosition_y+37,laserX2,robotPosition_y+37); 


//moving soldier
x+=5;
image(soldier,x ,soldierY);
x%=720; 


}
