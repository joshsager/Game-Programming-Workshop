
float x;
float y;
float vx;
float vy;
int score;

String gameState = "start";

void setup(){
  size(800,600);
  smooth();
  noStroke();
  spawnEnemy();
  
  vx=width*.5;
  vy=height*.5;
  score = 0;
}

void draw(){
  fill(255, 255, 255);
  text("Score:" +score, 15, 90);
  
  if(gameState != "gameOver"){
    if(dist(mouseX,mouseY,vx,vy) < 50){
      gameState = "gameOver";
      fill(0,0,0);
      rect(0,0,800,800);
    }
    
    fill(0,0,0,30);
    rect(0,0,800,800);
    fill(255,255,255);
    ellipse(mouseX,mouseY,50,50);

    fill(0,255,0);
    ellipse(x,y,50,50);
  
    if(dist(mouseX,mouseY,x,y)<50){
      spawnEnemy();
      score++;
    }

  
    fill(255,0,0);
    vx+=(mouseX-vx)*.02;
    vy+=(mouseY-vy)*.02;
  
    ellipse(vx,vy,50,50);
  }
  
}

void spawnEnemy(){
   x = random(width);
   y = random(height);
}
