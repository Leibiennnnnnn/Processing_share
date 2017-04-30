String file = "2017-3-12-11-41-21-K.csv";

Table table;
int rowNo, rowStart, rowEnd;
ArrayList<dotline> alDotLine = new ArrayList<dotline>();
int x1, x2, r;
//x1 is the x position of left dots
//x2 is the x position of right dots
//r is the radius of each dot

color cVal = color(91, 154, 0);    //valence
color cFrus = color(191, 8, 186);    //frustration
color cFoc = color(0, 137, 235);    //focus
color cExc = color(255, 85, 0);    //excitement

int beat, interval;

void setup() {
    size(1920, 1080);
    background(0);
    frameRate(24);

    table = loadTable(file, "header");

    rowStart = 569;
    rowEnd = 626;
    //define which part of the table is required
    //p4 st giles street 20s 569-626

    rowNo = rowStart-2;
    //rowNo means the current line of data

    x1 = width/2;
    x2 = width/2;
    r = 8;

    beat = 0;
    //beat counts the frames from the very beginning
    interval = 12;
    //interval defines when to feed a new line from the table
    //12 means refreshing every 12 frames
}

void draw() {

    //background(0);
    //we do not refresh the background in this sketch

    //feed a line of data every interval
    if ( beat%interval == 0 ) {
        TableRow row = table.getRow(rowNo);
        float valence = row.getFloat("valence");
        float frustration = row.getFloat("frustration");
        float focus = row.getFloat("focus");
        float excitement = row.getFloat("excitement");

        //create or refresh the ArrayList
        alDotLine.add(new dotline("exc", excitement, x1-r));
        alDotLine.add(new dotline("frus", frustration, x2+r));
        alDotLine.add(new dotline("val", valence, x1-r));
        alDotLine.add(new dotline("foc", focus, x2+r));

        x1 -= r*2;
        x2 += r*2;
    }

    //display dots
    for ( int i=0; i<alDotLine.size(); i++ ) {
        alDotLine.get(i).display();
    }

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
    //saveFrame("data/p4-Apr/screen-####.jpg");
}

void keyPressed() {
    if (key == 's') {
        saveFrame("data/screen-####.jpg");
    }
}