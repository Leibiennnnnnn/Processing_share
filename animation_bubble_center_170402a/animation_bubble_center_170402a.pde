String file = "2017-3-12-11-41-21-K.csv";

Table table;
int rowNo, rowStart, rowEnd;
ArrayList<bubble> bubbleVal = new ArrayList<bubble>();
ArrayList<bubble> bubbleFrus = new ArrayList<bubble>();
ArrayList<bubble> bubbleFoc = new ArrayList<bubble>();
ArrayList<bubble> bubbleExc = new ArrayList<bubble>();

int initpos;
sqrpoint sqrExc, sqrFrus, sqrVal, sqrFoc;
float noiseAngle;

color cVal = color(91, 154, 0);    //valence
color cFrus = color(191, 8, 186);    //frustration
color cFoc = color(0, 137, 235);    //focus
color cExc = color(255, 85, 0);    //excitement

int beat, interval;
float fNum;

void setup() {
    size(1920, 1080);
    background(0);
    frameRate(24);

    table = loadTable(file, "header");

    rowStart = 228;
    rowEnd = 280;
    //define which part of the table is required
    //p1 royal mile 5s 228-280
    //p2 royal mile 5s 494-509
    //p3 royal mile 15s 539-569

    rowNo = rowStart-2;
    //rowNo means the current line of data 

    TableRow row = table.getRow(rowNo);
    float valence = row.getFloat("valence");
    float frustration = row.getFloat("frustration");
    float focus = row.getFloat("focus");
    float excitement = row.getFloat("excitement");

    initpos = 50;
    noiseAngle = 0.0;
    sqrExc = new sqrpoint("exc", valence, width/2-initpos, height/2-initpos);
    sqrFrus = new sqrpoint("frus", frustration, width/2+initpos, height/2-initpos); 
    sqrVal = new sqrpoint("val", focus, width/2-initpos, height/2+initpos); 
    sqrFoc = new sqrpoint("foc", excitement, width/2+initpos, height/2+initpos);

    beat = 0;
    //beat counts the frames from the very beginning
    interval = 3;
    //interval defines when to feed a new line from the table
    //3 means refreshing every 3 frames
    fNum = 0.03;
    //fNum = 0.1;
    //fNum defines how many particles are to be generated
    //number of particles = (data value) * fNum
}

void draw() {

    background(0);

    //feed a line of data every interval
    if ( beat%interval == 0 ) {
        TableRow row = table.getRow(rowNo);
        float valence = row.getFloat("valence");
        float frustration = row.getFloat("frustration");
        float focus = row.getFloat("focus");
        float excitement = row.getFloat("excitement");

        sqrExc.vv = (excitement - sqrExc.value)/interval;
        sqrFrus.vv = (frustration - sqrFrus.value)/interval;
        sqrVal.vv = (valence - sqrVal.value)/interval;
        sqrFoc.vv = (focus - sqrFoc.value)/interval;

        sqrExc.value = excitement;
        sqrFrus.value = frustration;
        sqrVal.value = valence;
        sqrFoc.value = focus;

        //create or refresh the ArrayList
        int num = int(valence * fNum);
        if ( bubbleVal.size() == 0 ) {
            for (int i = 0; i < num; i++) {
                bubbleVal.add(new bubble("val", i, valence, sqrVal.x, sqrVal.y));
            }
        } else {
            int tsize = bubbleVal.size();
            for (int i = 0; i < tsize; i++) {
                bubbleVal.get(i).no = i;
            }
            for (int j = 0; j < num; j++) {
                bubbleVal.add(new bubble("val", tsize+j, valence, sqrVal.x, sqrVal.y));
            }
        }

        num = int(frustration * fNum);
        if ( bubbleFrus.size() == 0 ) {
            for (int i = 0; i < num; i++) {
                bubbleFrus.add(new bubble("frus", i, frustration, sqrFrus.x, sqrFrus.y));
            }
        } else {
            int tsize = bubbleFrus.size();
            for (int i = 0; i < tsize; i++) {
                bubbleFrus.get(i).no = i;
            }
            for (int j = 0; j < num; j++) {
                bubbleFrus.add(new bubble("frus", tsize+j, frustration, sqrFrus.x, sqrFrus.y));
            }
        }

        num = int(excitement * fNum);
        if ( bubbleExc.size() == 0 ) {
            for (int i = 0; i < num; i++) {
                bubbleExc.add(new bubble("exc", i, excitement, sqrExc.x, sqrExc.y));
            }
        } else {
            int tsize = bubbleExc.size();
            for (int i = 0; i < tsize; i++) {
                bubbleExc.get(i).no = i;
            }
            for (int j = 0; j < num; j++) {
                bubbleExc.add(new bubble("exc", tsize+j, excitement, sqrExc.x, sqrExc.y));
            }
        }

        num = int(focus * fNum);
        if ( bubbleFoc.size() == 0 ) {
            for (int i = 0; i < num; i++) {
                bubbleFoc.add(new bubble("foc", i, focus, sqrFoc.x, sqrFoc.y));
            }
        } else {
            int tsize = bubbleFoc.size();
            for (int i = 0; i < tsize; i++) {
                bubbleFoc.get(i).no = i;
            }
            for (int j = 0; j < num; j++) {
                bubbleFoc.add(new bubble("foc", tsize+j, focus, sqrFoc.x, sqrFoc.y));
            }
        }
    }

    //display the particles
    for (int i = bubbleVal.size()-1; i >= 0; i--) {
        bubbleVal.get(i).display();
    }
    for (int i = bubbleFrus.size()-1; i >= 0; i--) {
        bubbleFrus.get(i).display();
    }
    for (int i = bubbleExc.size()-1; i >= 0; i--) {
        bubbleExc.get(i).display();
    }
    for (int i = bubbleFoc.size()-1; i >= 0; i--) {
        bubbleFoc.get(i).display();
    }

    //display the central square
    noFill();
    stroke(100);
    noiseAngle += 0.1;

    line(sqrExc.x, sqrExc.y, sqrFrus.x, sqrFrus.y);
    line(sqrFrus.x, sqrFrus.y, sqrFoc.x, sqrFoc.y);
    line(sqrVal.x, sqrVal.y, sqrExc.x, sqrExc.y);
    line(sqrFoc.x, sqrFoc.y, sqrVal.x, sqrVal.y);
    //ellipse(width/2, height/2, sqrt(initpos*initpos*2)*2, sqrt(initpos*initpos*2)*2);

    sqrExc.display(); 
    sqrFrus.display(); 
    sqrVal.display(); 
    sqrFoc.display();

    //refresh the line of data if needed
    //automatically stop running when meeting the end
    if ( beat%interval == 0 ) { 
        if ( rowNo < rowEnd-2 ) {
            rowNo++;
        } else {
            println(beat);
            exit();
        }
    }

    //refresh beat
    beat++;

    //save the frame as an image
    //saveFrame("data/p1-Apr/screen-####.jpg");
}

void keyPressed() {
    if (key == 's') {
        saveFrame("data/screen-####.jpg");
    }
}