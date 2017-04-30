/**
 * Robot Screenshots (v2.22)
 * by  Amnon (2014/Nov/11)
 * mod GoToLoop
 *
 * forum.processing.org/two/discussion/8025/
 * take-a-screen-shot-of-the-screen
 */

//before start, we need to modify some settings in setup()
//the screenshot can work while the window is minimized
//click anywhere in the window to stop, or just close the window to stop
//the outcome will be placed in the folder titled the starting time
//there will be a sequence of images along with a text file recording eavery shot time

import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.AWTException;

PImage screenshot;
Rectangle dimension;
Robot robot;

String starttime;
String currenttime;
String shotname;
String[] time = new String[300];

void setup() {

    //!!!Here we should adjust the size to our screen resoluton (width, height)
    size(3000, 2000, JAVA2D);

    smooth(4);

    //!!!Here controls the screenshot frequency
    //0.5 means every 2 seconds
    //0.2 means every 5 seconds
    frameRate(.5);

    imageMode(CORNER);
    background((color) random(#000000));

    screenshot = createImage(displayWidth, displayHeight, ARGB);
    dimension  = new Rectangle(displayWidth, displayHeight);

    try {
        robot = new Robot();
    }
    catch (AWTException cause) {
        println(cause);
        exit();
    }

    starttime = str(year()) + "-" + str(month()) + "-" + str(day()) + "-" + str(hour()) + "-" + str(minute()) + "-" + str(second());
    time = append(time, starttime);
}

void draw() {
    image(grabScreenshot(screenshot, dimension, robot)
        , 0, 0, width, height);
    shotname = starttime+"/"+"-########.png";
    saveFrame(shotname);

    currenttime = str(year()) + "-" + str(month()) + "-" + str(day()) + "-" + str(hour()) + "-" + str(minute()) + "-" + str(second());
    time = append(time, currenttime);
}

void mousePressed() {
    saveStrings(starttime+"/0-time.txt", time);
    exit();
}

static final PImage grabScreenshot(PImage img, Rectangle dim, Robot bot) {
    //return new PImage(bot.createScreenCapture(dim));

    bot.createScreenCapture(dim).getRGB(0, 0
        , dim.width, dim.height
        , img.pixels, 0, dim.width);

    img.updatePixels();
    return img;
}