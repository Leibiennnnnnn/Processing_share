/*
M    2017-3-10-11-27-50-M.csv
 S   2017-3-10-13-11-23-S.csv
 K   2017-3-12-11-41-21-K.csv
 F   2017-3-12-12-29-8-F.csv
 B   2017-3-12-13-14-21-B.csv
!!!set your file name here, and then run the program    */
String file = "2017-3-12-11-41-21-K.csv";

Table table;
PImage map;
Boolean isSth;

/*
maplon    -3.19577693939209, -3.1889212131500244
 maplat    55.95118821272676, 55.94742160017106
 map_size    640*630
 */

void setup() {
    size(960, 630);
    background(255);

    map = loadImage("map.jpg");
    image(map, 0, 0);

    table = loadTable(file, "header");

    isSth = false;

    int i = 2;
    for (TableRow row : table.rows()) {

        if ( row.getFloat("lat") == row.getFloat("lat") ) {
            int no = i;
            String time = row.getString("time");
            float valence = row.getFloat("valence");
            float frustration = row.getFloat("frustration");
            float focus = row.getFloat("focus");
            float excitement = row.getFloat("excitement");
            float lat = row.getFloat("lat");
            float lon = row.getFloat("lon");

            objMapPoint temp = new objMapPoint(no, time, valence, frustration, focus, excitement, lat, lon);
            temp.display();

            //println(no+"  "+time+"  "+lat+"  "+lon);
        }

        i++;
    }

    isSth = false;
}

void draw() {

    background(255);
    image(map, 0, 0);

    int i = 2;
    for (TableRow row : table.rows()) {

        if ( row.getFloat("lat") == row.getFloat("lat") ) {
            int no = i;
            String time = row.getString("time");
            float valence = row.getFloat("valence");
            float frustration = row.getFloat("frustration");
            float focus = row.getFloat("focus");
            float excitement = row.getFloat("excitement");
            float lat = row.getFloat("lat");
            float lon = row.getFloat("lon");

            objMapPoint temp = new objMapPoint(no, time, valence, frustration, focus, excitement, lat, lon);
            temp.display();

            //println(no+"  "+time+"  "+lat+"  "+lon);
        }

        i++;
    }

    isSth = false;
}

void keyPressed() {
    if (key == 's') {
        saveFrame("data/screen-####.jpg");
    }
}