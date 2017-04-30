String file = "2017-3-12-11-41-21-K.csv";

Table table;
int rowNo, rowStart, rowEnd, rowCP1, rowCP2;
float valence;
float frustration;
float focus;
float excitement;
ArrayList<bubble> bubbleVal = new ArrayList<bubble>();
ArrayList<bubble> bubbleFrus = new ArrayList<bubble>();
ArrayList<bubble> bubbleFoc = new ArrayList<bubble>();
ArrayList<bubble> bubbleExc = new ArrayList<bubble>();

midpoint midExc, midFrus, midVal, midFoc;

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

    rowStart = 494;
    rowEnd = 572;
    rowCP1 = 509;
    rowCP2 = 539;
    //define which part of the table is required
    //p2 royal mile 5s 494-509
    //p2.5 royal mile 5s 509-539
    //p3 royal mile 15s 539-569

    rowNo = rowStart-2;
    //rowNo means the current line of data 

    TableRow row = table.getRow(rowNo);
    valence = row.getFloat("valence");
    frustration = row.getFloat("frustration");
    focus = row.getFloat("focus");
    excitement = row.getFloat("excitement");

    midExc = new midpoint("exc", valence, width/2, height/4-height/8);
    midFrus = new midpoint("frus", frustration, width/2, height/2-height/8); 
    midVal = new midpoint("val", focus, width/2, height/2+height/8); 
    midFoc = new midpoint("foc", excitement, width/2, height/4*3+height/8);

    beat = 0;
    //beat counts the frames from the very beginning
    interval = 4;
    //interval defines when to feed a new line from the table
    //4 means refreshing every 4 frames
    fNum = 0.05;
    //fNum = 0.1;
    //fNum defines how many particles are to be generated
    //number of particles = (data value) * fNum
}

void draw() {

    background(0);

    //feed a line of data every interval
    if ( beat%interval == 0 ) {
        TableRow row = table.getRow(rowNo);
        valence = row.getFloat("valence");
        frustration = row.getFloat("frustration");
        focus = row.getFloat("focus");
        excitement = row.getFloat("excitement");

        midExc.vv = (excitement - midExc.value)/interval;
        midFrus.vv = (frustration - midFrus.value)/interval;
        midVal.vv = (valence - midVal.value)/interval;
        midFoc.vv = (focus - midFoc.value)/interval;

        midExc.value = excitement;
        midFrus.value = frustration;
        midVal.value = valence;
        midFoc.value = focus;
    }

    //generate new particles every 4 frames
    if ( beat%4 == 0 ) {
        int num = int(valence * fNum);
        if ( bubbleVal.size() == 0 ) {
            for (int i = 0; i < num; i++) {
                bubbleVal.add(new bubble("val", i, valence, midVal.x, midVal.y));
            }
        } else {
            int tsize = bubbleVal.size();
            for (int i = 0; i < tsize; i++) {
                bubbleVal.get(i).no = i;
            }
            for (int j = 0; j < num; j++) {
                bubbleVal.add(new bubble("val", tsize+j, valence, midVal.x, midVal.y));
            }
        }

        num = int(frustration * fNum);
        if ( bubbleFrus.size() == 0 ) {
            for (int i = 0; i < num; i++) {
                bubbleFrus.add(new bubble("frus", i, frustration, midFrus.x, midFrus.y));
            }
        } else {
            int tsize = bubbleFrus.size();
            for (int i = 0; i < tsize; i++) {
                bubbleFrus.get(i).no = i;
            }
            for (int j = 0; j < num; j++) {
                bubbleFrus.add(new bubble("frus", tsize+j, frustration, midFrus.x, midFrus.y));
            }
        }

        num = int(excitement * fNum);
        if ( bubbleExc.size() == 0 ) {
            for (int i = 0; i < num; i++) {
                bubbleExc.add(new bubble("exc", i, excitement, midExc.x, midExc.y));
            }
        } else {
            int tsize = bubbleExc.size();
            for (int i = 0; i < tsize; i++) {
                bubbleExc.get(i).no = i;
            }
            for (int j = 0; j < num; j++) {
                bubbleExc.add(new bubble("exc", tsize+j, excitement, midExc.x, midExc.y));
            }
        }

        num = int(focus * fNum);
        if ( bubbleFoc.size() == 0 ) {
            for (int i = 0; i < num; i++) {
                bubbleFoc.add(new bubble("foc", i, focus, midFoc.x, midFoc.y));
            }
        } else {
            int tsize = bubbleFoc.size();
            for (int i = 0; i < tsize; i++) {
                bubbleFoc.get(i).no = i;
            }
            for (int j = 0; j < num; j++) {
                bubbleFoc.add(new bubble("foc", tsize+j, focus, midFoc.x, midFoc.y));
            }
        }
    }

    //display the particles
    for (int i = bubbleVal.size()-1; i >= 0; i--) {        
        bubbleVal.get(i).no = i;
        bubbleVal.get(i).display();
    }
    for (int i = bubbleFrus.size()-1; i >= 0; i--) {
        bubbleFrus.get(i).no = i;
        bubbleFrus.get(i).display();
    }
    for (int i = bubbleExc.size()-1; i >= 0; i--) {
        bubbleExc.get(i).no = i;
        bubbleExc.get(i).display();
    }
    for (int i = bubbleFoc.size()-1; i >= 0; i--) {
        bubbleFoc.get(i).no = i;
        bubbleFoc.get(i).display();
    }

    //display middle circles
    midExc.display(); 
    midFrus.display(); 
    midVal.display(); 
    midFoc.display();

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

    //change the interval when meeting the checkpoints
    if ( rowNo == rowCP1 ) {
        interval = 8;
    } else if ( rowNo == rowCP2 ) {
        interval = 12;
    }

    //refresh beat
    beat++;

    //save the frame as an image
    //saveFrame("data/p2-3-Apr/screen-####.jpg");
}

void keyPressed() {
    if (key == 's') {
        saveFrame("data/screen-####.jpg");
    }
}