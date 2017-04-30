//This is the animation of particles

class bubble {
    int no;
    float x, y, d, r, vx, vy, alpha, va;
    String type;
    color ctype;
    ArrayList<bubble> alBubble;
    int intvx = 32;
    int intvy = 18;
    int rdm = 10;

    //color cVal = color(91, 154, 0);    //valence
    //color cFrus = color(191, 8, 186);    //frustration
    //color cFoc = color(0, 137, 235);    //focus
    //color cExc = color(255, 85, 0);    //excitement

    bubble(String ttype, int tno, float tf, float tx, float ty) {
        no = tno;
        x = tx;
        y = ty;
        type = ttype;

        if ( type == "exc" ) {
            vx = -intvx + random(-rdm, rdm);
            vy = -intvy + random(-rdm, rdm);
            ctype = cExc;
            alBubble = bubbleExc;
        } else if ( type == "frus" ) {
            vx = intvx + random(-rdm, rdm);
            vy = -intvy + random(-rdm, rdm);
            ctype = cFrus;
            alBubble = bubbleFrus;
        } else if ( type == "val" ) {
            vx = -intvx + random(-rdm, rdm);
            vy = intvy + random(-rdm, rdm);
            ctype = cVal;
            alBubble = bubbleVal;
        } else if ( type == "foc" ) {
            vx = intvx + random(-rdm, rdm);
            vy = intvy + random(-rdm, rdm);
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
            ellipse(x, y, d, d);
        }
                
        x += vx;
        y += vy;
        vx /= 1.08;
        vy /= 1.08;
        alpha += va;
    }
}