ArrayList<creature>creatures = new ArrayList<creature>();
game game;
creature creature;
float[] mutatedGenome;
float[] randomGenome;
float[] parentGenome;
int creationID;
int POPULATION_SIZE;
int generation;

void setup() {
  size(1500,1000);
  POPULATION_SIZE = 500;
  generation = 1;
  mutatedGenome = new float[24];
  randomGenome = new float[24];
  parentGenome = new float[24];
  game = new game();
  random_generation();
}

void random_genome() {
  for(int u=0; u < 23; u++) {
    randomGenome[u] = random(-1,1);
  }
}
void random_generation() {
  for(int c=0; c < POPULATION_SIZE; c++) {
    
    creationID++;
    random_genome();
    mutate_gene(randomGenome);
    println("new creature");
    println("id " + creationID);
    println("neural network " + mutatedGenome);
    
    creatures.add(new creature(mutatedGenome,generation,creationID,true));
  }
}

void mutate_gene(float[] gene_to_mutate) {
  mutatedGenome = gene_to_mutate;
  int index = round(random(23));
  float edit = random(-1,1);
  mutatedGenome[index] = edit;
}

void draw() {
  background(255);
  fill(0);

  
  game.display();
  game.run();
  
  for(creature c : creatures) {
    c.display();
    c.inputs();
    c.brain_think();
    c.output();
    c.fitness();
  }
}
