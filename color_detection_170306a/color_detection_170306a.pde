/*
Codes reference:
@clankill3r: https://forum.processing.org/one/topic/detect-colored-blobs.html
 
 The sample image is from:
 http://geek-mag.com/posts/259698/
 (https://habrastorage.org/files/98d/2cd/4cc/98d2cd4cc252433eb0ad256b3adccaf5.png)
 */

PImage img;
PImage preparedImage;

color ctarget;
color magenta = color(252, 40, 252);    //interest
color greencyan = color(42, 179, 178);    //engagement
color green = color(170, 211, 108);    //focus
color blue = color(55, 107, 251);    //relaxation
color orange = color(253, 121, 56);    //instantaneous excitement
color cyanblue = color(155, 205, 253);    //Long Term excitement
color bg = color(103, 97, 100);

int top = 0;
int bottom = 0;

void setup() {

    size(1920, 640);
    background(0);
    img = loadImage("pm_screenshot.png");

    preparedImage = img.get();

    detectThreshold(img, preparedImage, bg);

    ctarget = magenta;

    detectLine(img, preparedImage, ctarget);
    image(preparedImage, 0, 0);
}

void draw() {
    image(preparedImage, 0, 0);

    getPointData();
}

void keyPressed() {
    if (key == 's') {
        saveFrame("data/screen-####.jpg");
    }
}