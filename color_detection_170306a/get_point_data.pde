void getPointData() {
    color cHighlight = color(255, 255, 0, 150);
    color cData = color(0);
    float data;

    for (int x = 375; x < 1875; x += 5) {
        if ( mouseX > x-2.5 && mouseX < x+2.5) {
            stroke(cHighlight);
            noFill();
            line(x, top, x, bottom);
            fill(cHighlight);
            noStroke();
            ellipse(x, mouseY, 10, 10);
            data = map(mouseY, top, bottom, 100, 0);
            fill(cData);
            textSize(18);
            textAlign(CENTER, CENTER);
            text(x+", "+data, x, top/2);
        }
    }
}