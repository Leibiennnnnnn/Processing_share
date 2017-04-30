/*
Reference
 @amnon: https://forum.processing.org/two/discussion/8025/take-a-screen-shot-of-the-screen
*/

/*
import java.awt.*;
PImage screenshot;
String starttime;
String currenttime;
String shotname;
String[] time = new String[300];

void setup() {
    size(3000, 2000);
    frameRate(30);

    starttime = str(year()) + "-" + str(month()) + "-" + str(day()) + "-" + str(hour()) + "-" + str(minute()) + "-" + str(second());
    time = append(time, starttime);
}

void draw() {
    if (frameCount % 150 == 0)
    {
        screenshot();
    }

    if (screenshot != null) {
        image(screenshot, 0, 0, width, height);
        shotname = starttime+"/"+"-########.png";
        saveFrame(shotname);

        currenttime = str(year()) + "-" + str(month()) + "-" + str(day()) + "-" + str(hour()) + "-" + str(minute()) + "-" + str(second());
        time = append(time, currenttime);
    }
}

void mousePressed() {
    saveStrings(starttime+"/0-time.txt", time);
    exit();
}

*/

/*

void screenshot() {
    try {
        screenshot = new PImage(new Robot().createScreenCapture(new Rectangle(0, 0, displayWidth, displayHeight)));
    } 
    catch (AWTException e) {
    }
}

*/

/*

 String framename = filename+"/"+filename+"-####.png";
 
 PImage tower = loadImage("tower.jpg");
 tower.save("outputImage.jpg");
 
 saveFrame(framename);
 }
 
 
 String words = "apple bear cat dog";
 String[] list = split(words, ' ');
 
 // Writes the strings to a file, each on a separate line
 saveStrings("nouns.txt", list);
 */