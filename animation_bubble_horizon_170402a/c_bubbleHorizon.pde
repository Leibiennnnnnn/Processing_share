//This is the animation of particles

class bubble {
    int no;
    float x1, x2, y1, y2, d, r, initvx, vx1, vx2, vy1, vy2, alpha, va;
    String type;
    color ctype;
    ArrayList<bubble> alBubble;
    int rdm = 5;

    //color cVal = color(91, 154, 0);    //valence
    //color cFrus = color(191, 8, 186);    //frustration
    //color cFoc = color(0, 137, 235);    //focus
    //color cExc = color(255, 85, 0);    //excitement

    bubble(String ttype, int tno, float tf, float tx, float ty) {
        no = tno;
        x1 = tx;
        x2 = tx;
        y1 = ty;
        y2 = ty;
        initvx = 5 + 15 * tf * 0.01;
        vx1 = -initvx + random(-rdm, rdm);
        vy1 = random(-rdm, rdm);
        vx2 = initvx + random(-rdm, rdm);
        vy2 = random(-rdm, rdm);
        type = ttype;

        if ( type == "exc" ) {
            ctype = cExc;
            alBubble = bubbleExc;
        } else if ( type == "frus" ) {
            ctype = cFrus;
            alBubble = bubbleFrus;
        } else if ( type == "val" ) {
            ctype = cVal;
            alBubble = bubbleVal;
        } else if ( type == "foc" ) {
            ctype = cFoc;
            alBubble = bubbleFoc;
        }

        d = 5 + 10 * tf * 0.01;
        r = d/2;
        alpha = 100 + 155 * tf * 0.01;

        //va = -2;
        va = -2-(120-tf)*0.01;
    }

    void display() {

        if ( alpha < 0 ) {
            alBubble.remove(no);
        } else {
            noStroke();
            fill(ctype, alpha);
            ellipse(x1, y1, d, d);
            ellipse(x2, y2, d, d);
        }

        x1 += vx1;
        y1 += vy1;
        vx1 /= 1.02;
        vy1 /= 1.02;
        x2 += vx2;
        y2 += vy2;
        vx2 /= 1.02;
        vy2 /= 1.02;
        alpha += va;
    }
}