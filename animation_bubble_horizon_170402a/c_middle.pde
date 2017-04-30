//This is the animation of middle circles

class midpoint {
    float x, y, d, r, value, vd, vv;
    color c;

    //color cVal = color(91, 154, 0);    //valence
    //color cFrus = color(191, 8, 186);    //frustration
    //color cFoc = color(0, 137, 235);    //focus
    //color cExc = color(255, 85, 0);    //excitement

    midpoint(String type, float tf, float tx, float ty) {
        x = tx;
        y = ty;
        value = tf;

        if ( type == "exc" ) {
            c = cExc;
        } else if ( type == "frus" ) {
            c = cFrus;
        } else if ( type == "val" ) {
            c = cVal;
        } else if ( type == "foc" ) {
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
    }
}