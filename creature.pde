class creature {
  float x;
  float y;
  float fitness_score;
  int generation;
  float[] brain;
  float[] NNstructure;
  int id;
  int colx;
  int coly;
  
  creature(float[] genome, int gen_, int id_, boolean random) {
    this.NNstructure = genome;
    this.generation = gen_;
    this.id = id_;
    this.brain = new float[8];
    this.x = random(width);
    this.y = random(height);
    this.fitness_score = 0;
    colx = 0;
    coly = 0;
    if (random == true) {
      for(int e=0; e<23; e++) {
        this.NNstructure[e] = random(-1,1);
      }
    }
  }
  
  void display() {
    fill(this.colx,255,this.coly);
    ellipse(this.x,this.y,32,32);
    fill(0);
    textSize(10);
    textAlign(CENTER, CENTER);
    text(this.id,this.x,this.y-5);
    text(round(this.fitness_score)/4000,this.x,this.y+5);
  }
  
  void inputs() {
    if(this.x < game.x) {
      this.brain[0] = 1;
    }
    else {
      this.brain[0] = -1;
    }
    
    if(this.x > game.x) {
      this.brain[1] = 1;
    }
    else {
      this.brain[1] = -1;
    }
    
    if(this.y < game.y) {
      this.brain[2] = 1;
    }
    else {
      this.brain[2] = -1;
    }
    
    if(this.y > game.y) {
      this.brain[3] = 1;
    }
    else {
      this.brain[3] = -1;
    }
  }
  
  void brain_think() {
    for(int i=4; i<=7; i++) {
      for(int j=0; i<=3; j++) {
        int con1 = j;
        int con2 = i;
        this.brain[i] += this.brain[j] * this.NNstructure[((con2*4)+con1)-1];
        
      }
      this.brain[i] *= 0.25;
    }
  }
  
  void output() {
    if(max(this.brain[0],this.brain[1]) == this.brain[0]) {
      x+=2;
      colx+=2;
    }
    else if(max(this.brain[0],this.brain[1]) == this.brain[1]) {
      x-=2;
      colx -=2;
    }
    
    if(max(this.brain[2],this.brain[3]) == this.brain[2]) {
      y+=2;
      coly +=2;
    }
    else if(max(this.brain[2],this.brain[3]) == this.brain[3]) {
      y-=2;
      coly -= 2;
    }    
  }
  
  void fitness() {
    fitness_score += dist(this.x,this.y,game.x,game.y);
  }
  
  void live() {
    this.display();
    this.inputs();
    this.brain_think();
    this.output();
    this.fitness();
  }
}

    
    
