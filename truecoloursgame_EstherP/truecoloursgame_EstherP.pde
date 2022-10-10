//Esther Pang
//Blk : 1-4

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// VARIABLES ================================================
// mode framework
int  mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

// colour variables
color purple = #A784A2;
color pink = #FAA9C8;
color green = #71B263;
color blue = #9AC4C9;
color creme = #fefae0;
color yellow = #FCEA8F;
color red = #E06534;
color orange = #FFAD15;
color lightmatcha =#e9edc9;
color matcha = #ccd5ae;
color coffee = #faedcd;
color caramel = #d4a373;
color greyblue = #aabdd1;
color darkgreyblue= #839DB7;
color lightblue = #D0DCE8;

//text variables
float textsize;
PFont bubblefont;

//colour match variables
int choice = 0;
int point;
int randomGenerator;

//scoring variables
int score;
int timer;
int highscore;
int scorecount;

//keyboard variables
boolean leftkey, rightkey;

// image variables
PImage cloud;
PImage scoreboard;

// gif variables
PImage [] gif;
int numberOfFrames;
int f;

PImage [] gif2;
int numberOfFrames2;
int f2;

PImage [] gif3;
int numberOfFrames3;
int f3;

PImage [] gif4;
int numberOfFrames4;
int f4;

//gameover gif
boolean gamelost;


//random color
int randomWord = (int) random(0, 7);
int randomColor = (int) random(0, 7);
String[] words = {"Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Pink"};
color[] colors = {red, orange, yellow, green, blue, purple, pink};

//music
Minim minim;
AudioPlayer buttonclick, scoresound, intro, gameover;

// ===================================
void setup() {
  size(800, 600);
  mode = INTRO;

  //initialize score
  score = 0;

  //initialize gameover screen
  gamelost = true;

  //initialize timer
  timer = 200;

  //intialize textsize
  textsize = 70;

  //intialize keyboard
  leftkey = rightkey = false;

  //font
  bubblefont = createFont("Pathagonia.ttf", 100);
  textAlign(CENTER, CENTER);

  //loading image
  cloud = loadImage("cloud 1.png");
  scoreboard = loadImage("leaderboard.png");

  // 50/50 split
  random50();

  // initialize intro gif
  numberOfFrames = 20;
  gif = new PImage [numberOfFrames];

  int i = 0;
  while (i < numberOfFrames ) {
    gif[i] = loadImage ("frame_"+i+"_delay-0.1s.gif");
    i++;
  }

  // initialize game gif
  numberOfFrames2 = 8;
  gif2 = new PImage [numberOfFrames2];
  int c = 0;
  while (c < numberOfFrames2) {
    gif2[c] = loadImage("frame_"+c+"_delay-0.15s.gif");
    c = c + 1;
  }

  // initialize win gameover gif
  numberOfFrames3 = 10;
  gif3 = new PImage [numberOfFrames3];
  int g = 0;
  while (g < numberOfFrames3) {
    gif3[g] = loadImage("frame_"+g+"_delay-0.11s.gif");
    g = g + 1;
  }

  // initialize lose gameover gif
  numberOfFrames4 = 26;
  gif4 = new PImage [numberOfFrames4];
  int j = 0;
  while (j < numberOfFrames4) {
    gif4[j] = loadImage("frame_"+j+"_delay-0.12s.gif");
    j = j + 1;
  }

  //minim
  minim = new Minim(this);
  //buttonclick = minim.loadFile("buttonclicksound .wav");
  gameover = minim.loadFile("FAILURE.wav");
  scoresound = minim.loadFile("SUCCESS.wav");
  intro = minim.loadFile("MUSIC.mp3");
}

void draw () {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error:Mode = " + mode);
  }
}
