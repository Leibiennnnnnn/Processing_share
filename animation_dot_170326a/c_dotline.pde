//This is the animation of dots

class dotline {
    int num, status;
    float x, y, d, alpha;
    int directy;
    String type;
    color ctype;

    //color cVal = color(91, 154, 0);    //valence
    //color cFrus = color(191, 8, 186);    //frustration
    //color cFoc = color(0, 137, 235);    //focus
    //color cExc = color(255, 85, 0);    //excitement

    dotline(String ttype, float tf, float tx) {
        x = tx;
        y = height/2;
        type = ttype;
        num = int(tf/3);
        status = 0;

        if ( type == "exc" ) {
            ctype = cExc;
            directy = -1;
        } else if ( type == "frus" ) {
            ctype = cFrus;
            directy = -1;
        } else if ( type == "val" ) {
            ctype = cVal;
            directy = 1;
        } else if ( type == "foc" ) {
            ctype = cFoc;
            directy = 1;
        }

        d = r*2;
        alpha = 10 + 245 * tf * 0.01;
    }

    void display() {
        
        noStroke();
        fill(red(ctype), green(ctype), blue(ctype), alpha);

        if ( status < num ) {
            ellipse(x, y+directy*r, d-2, d-2);
            status++;
            y += directy*d;
        }
        
        alpha -= 5;
    }
}