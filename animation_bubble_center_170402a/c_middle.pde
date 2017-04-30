//This is the animation of the central square

class sqrpoint {
    float x, y, bx1, bx2, by1, by2, d, r, value, vd, vv;
    color c;
    int area = initpos + 20;
    float angle;

    //color cVal = color(91, 154, 0);    //valence
    //color cFrus = color(191, 8, 186);    //frustration
    //color cFoc = color(0, 137, 235);    //focus
    //color cExc = color(255, 85, 0);    //excitement

    sqrpoint(String type, float tf, float tx, float ty) {
        x = tx;
        y = ty;
        value = tf;

        if ( type == "exc" ) {
            bx1 = width/2-area;
            bx2 = width/2;
            by1 = height/2-area;
            by2 = height/2;
            angle = PI/4+PI;
            c = cExc;
        } else if ( type == "frus" ) {
            bx1 = width/2;
            bx2 = width/2+area;
            by1 = height/2-area;
            by2 = height/2;
            angle = PI/4+PI/2;
            c = cFrus;
        } else if ( type == "val" ) {
            bx1 = width/2-area;
            bx2 = width/2;
            by1 = height/2;
            by2 = height/2+area;
            angle = PI/4+PI*3/2;
            c = cVal;
        } else if ( type == "foc" ) {
            bx1 = width/2;
            bx2 = width/2+area;
            by1 = height/2;
            by2 = height/2+area;
            angle = PI/4;
            c = cFoc;
        }

        d = 5 + 45 * value * 0.01;
        r = d/2;
    }

    void display() {

        noStroke();
        fill(c);
        vd = 45 * vv * 0.01;
        d += vd;
        ellipse(x, y, d, d);

        angle += map(noise(noiseAngle), 0, 1, -PI/180, PI/180);
        x = width/2 + sin(angle)*sqrt(initpos*initpos*2);
        y = height/2 + cos(angle)*sqrt(initpos*initpos*2);
        
        /*
        while ( x<bx1 || x>bx2 || y<by1 || y>by2 ) {
            x += random(-1, 1);
            y += random(-1, 1);
        }
        */
    }
}