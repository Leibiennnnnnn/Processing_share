String file = "2017-3-12-11-41-21-K.csv";

Table table;
int rowNo, rowStart, rowEnd;
ArrayList<blast> blastVal = new ArrayList<blast>();
ArrayList<blast> blastFrus = new ArrayList<blast>();
ArrayList<blast> blastFoc = new ArrayList<blast>();
ArrayList<blast> blastExc = new ArrayList<blast>();

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

    rowStart = 890;
    rowEnd = 940;
    //define which part of the table is required
    //p5 royal mile 10s 895-934
    //p6 parliament square 10s 934-960
    
    rowNo = rowStart-2;
    //rowNo means the current line of data 

    beat = 0;
    //beat counts the frames from the very beginning
    interval = 8;
    //interval defines when to feed a new line from the table
    //8 means refreshing every 8 frames
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

        //create or refresh the ArrayList
        if ( blastVal.size() == 0 ) {
            blastVal.add(new blast("val", 0, valence));
        } else {
            int tsize = blastVal.size();
            for (int i = 0; i < tsize; i++) {
                blastVal.get(i).no = i;
            }
            blastVal.add(new blast("val", tsize, valence));
        }

        if ( blastFrus.size() == 0 ) {
            blastFrus.add(new blast("frus", 0, frustration));
        } else {
            int tsize = blastFrus.size();
            for (int i = 0; i < tsize; i++) {
                blastFrus.get(i).no = i;
            }
            blastFrus.add(new blast("frus", tsize, frustration));
        }

        if ( blastExc.size() == 0 ) {
            blastExc.add(new blast("exc", 0, excitement));
        } else {
            int tsize = blastExc.size();
            for (int i = 0; i < tsize; i++) {
                blastExc.get(i).no = i;
            }
            blastExc.add(new blast("exc", tsize, excitement));
        }

        if ( blastFoc.size() == 0 ) {
            blastFoc.add(new blast("foc", 0, focus));
        } else {
            int tsize = blastFoc.size();
            for (int i = 0; i < tsize; i++) {
                blastFoc.get(i).no = i;
            }
            blastFoc.add(new blast("foc", tsize, focus));
        }
    }

    //display the animation
    for (int i = blastVal.size()-1; i >= 0; i--) {
        blastVal.get(i).display();
    }
    for (int i = blastFrus.size()-1; i >= 0; i--) {
        blastFrus.get(i).display();
    }
    for (int i = blastExc.size()-1; i >= 0; i--) {
        blastExc.get(i).display();
    }
    for (int i = blastFoc.size()-1; i >= 0; i--) {
        blastFoc.get(i).display();
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
    //saveFrame("data/p6-Apr/screen-####.jpg");
}

void keyPressed() {
    if (key == 's') {
        saveFrame("data/screen-####.jpg");
    }
}