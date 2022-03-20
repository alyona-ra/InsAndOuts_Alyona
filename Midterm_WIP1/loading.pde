void loadingScreen() {

  background(bg);
  
  image(bg4, -60+sp4, 0);
  image(bg6, 110+sp6, 0);
  
  noStroke();
  fill(sunC);
  circle(sunX-spS, sunY, sunW);
  spS += 3;
  if (-spS + sunX  < - sunW) {
    spS =  - width + sunX - sunW/2;
  }
  
  image(bg1, 80+sp1, 0);
  image(bg2, -180+sp2, 0);
  image(bg3, 200+sp3, 0);
  image(bg5, -150+sp5, 0);
  image(bg7, -250+sp7, 0);
  image(bg8, 70+sp8, 0);
  image(bottom, 0 - spB, 0);
  
  image(gump, 0, 0);
  
  if (pressed) {
    textC = #e1825c;
    bg = #19021f;
    sunC = #ffffff;
  } else if (!pressed) {
    textC = #19021f;
    bg = #f8c0c3;
    sunC = #eb6661;
  }
  fill(textC);
  textFont(font);
  text(name1, 80, 100);
  text(name2, 220, 150);
  
  sp1 += 3;
  sp2 += 3;
  sp3 += 3;
  sp4 += 3;
  sp5 += 3;
  sp6 += 3;
  sp7 += 3;
  sp8 += 3;
  spB += 3;
  
  if (spB > width) {
    spB = -width;
  }
  
  if (sp1 + 80 > width) {
    sp1 = -80  - width;
  } else if (sp2 - 180 > width) {
    sp2 = 180  - width;
  } else if (sp3 + 200 > width) {
    sp3 = - 200 - width;
  } else if (sp4 - 80 > width) {
    sp4 = 80  - width;
  } else if (sp5 - 150 > width) {
    sp5 = 150  - width;
  } else if (sp6 + 110 > width) {
    sp6 = -110  - width;
  } else if (sp7 - 250 > width) {
    sp7 = 250  - width;
  } else if (sp8 + 70 > width) {
    sp8 = -70  - width;
  }
  
}
