class objMapPoint {
    //draw circle

    int no;
    String time;
    float valence;
    float frustration;
    float focus;
    float excitement;
    float lat;
    float lon;
    float x;
    float y;
    float d = 20;
    color cDisplay = color(255, 0, 0, 100);
    color cHover = color(255, 255, 0, 150);

    Boolean isHover = false;

    objMapPoint(int tno, String ttime, float tvalence, float tfrustration, float tfocus, float texcitement, float tlat, float tlon) {
        no = tno;
        time = ttime;
        valence = tvalence;
        frustration = tfrustration;
        focus = tfocus;
        excitement = texcitement;
        lat = tlat;
        lon = tlon;

        x = map(lon, -3.19577693939209, -3.1889212131500244, 0, 640);
        y = map(lat, 55.95118821272676, 55.94742160017106, 0, 630);
    }


    void checkHover() {
        if ( checkInCircle(mouseX, mouseY, x, y, d) ) {
            isHover = true;
        } else {
            isHover = false;
        }
    }

    void display() {

        checkHover();

        noStroke();
        
        if ( isHover && !isSth) {
            fill(cHover);
            ellipse(x, y, d, d);
            fill(0);
            textSize(18);
            textAlign(LEFT, LEFT);
            text("Row: "+no, 660, 200);
            text("Time: "+time, 660, 250);
            text("Valence: "+valence+"%", 660, 300);
            text("Frustration: "+frustration+"%", 660, 350);
            text("Focus: "+focus+"%", 660, 400);
            text("Excitement: "+excitement+"%", 660, 450);
            isSth = true;
        } else {
            fill(cDisplay);
            ellipse(x, y, d, d);
        }
    }
}