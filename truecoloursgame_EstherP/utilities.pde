boolean mousetouchingRect(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true;
  } else {
    return false;
  }
}


void tactileRect(int x, int y, int w, int h, int r, color inside, color outline) {
  stroke(outline);
  fill(inside);
  if (mousetouchingRect(x, y, w, h)) {
    strokeWeight(5);
  } else {
    strokeWeight(2);
  }
  rect(x, y, w, h, r ); // left rect
}


void reset() {
  score = 0;
  timer = 200;
  textsize =70;
  gamelost = true;
  intro.rewind();
  resetcolor();
}
