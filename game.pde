class game {
  float x;
  float y;
  
  game() {
    this.x = random(width);
    this.y = random(height);
  }
  
  void display() {
    fill(255,0,0);
    ellipse(this.x,this.y,32,32);
  }
  
  void move() {
    this.x += random(-30,30);
    this.y += random(-30,30);
  }
  
  void run() {
    this.display();
    this.move();
  }
}
