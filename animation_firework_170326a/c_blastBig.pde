//This is the animation of big fireworks

/*

class blast {
    int no;
    int status, st1, st2, st3, st4;
    float x, y, d, r, alpha, angle;
    String type;
    color ctype;
    ArrayList<blast> alBlast;

    //color cVal = color(91, 154, 0);    //valence
    //color cFrus = color(191, 8, 186);    //frustration
    //color cFoc = color(0, 137, 235);    //focus
    //color cExc = color(255, 85, 0);    //excitement

    blast(String ttype, int tno, float tf) {
        no = tno;
        x = random(width);
        y = random(height);
        status = 0;
        type = ttype;

        if ( type == "exc" ) {
            ctype = cExc;
            alBlast = blastExc;
        } else if ( type == "frus" ) {
            ctype = cFrus;
            alBlast = blastFrus;
        } else if ( type == "val" ) {
            ctype = cVal;
            alBlast = blastVal;
        } else if ( type == "foc" ) {
            ctype = cFoc;
            alBlast = blastFoc;
        }

        d = 50 + 150 * tf * 0.01;
        r = d/2;
        alpha = 10 + 245 * tf * 0.01;
        angle = random(PI/8);
        st1 = int( 12*(1+tf*0.01) );
        st2 = st1 + int( st1*0.5 );
        st3 = st2 + 6;
        st4 = st3 + 4;

        //va = -2;
        //va = -1.5-(120-tf)*0.01;
    }

    void display() {

        noStroke();

        if ( status < st1 ) {
            fill(red(ctype), green(ctype), blue(ctype), alpha*status/st1);
            ellipse(x, y, r+r*status/st1, r+r*status/st1);
        } else if ( status < st2 ) {
            fill(red(ctype), green(ctype), blue(ctype), alpha);
            ellipse(x, y, d, d);
            pushMatrix();
            translate(x, y);
            rotate(angle);
            for ( int i=0; i<8; i++ ) {
                ellipse(r+r*0.35/(st2-st1)*(status-st1), 0, d*0.05/(st2-st1)*(status-st1), d*0.05/(st2-st1)*(status-st1));
                rotate(PI/4);
            }
            rotate(PI/8);
            for ( int i=0; i<8; i++ ) {
                ellipse(r+r*0.35/(st2-st1)*(status-st1), 0, d*0.05/(st2-st1)*(status-st1), d*0.05/(st2-st1)*(status-st1));
                rotate(PI/4);
            }
            popMatrix();
        } else if ( status < st3 ) {
            fill(red(ctype), green(ctype), blue(ctype), alpha);
            ellipse(x, y, d, d);
            pushMatrix();
            translate(x, y);
            rotate(angle);
            for ( int i=0; i<8; i++ ) {
                ellipse(r*1.35, 0, d*0.05, d*0.05);
                rotate(PI/4);
            }
            rotate(PI/8);
            for ( int i=0; i<8; i++ ) {
                ellipse(r*1.35+r*0.15/(st3-st2)*(status-st2), 0, d*0.05, d*0.05);
                rotate(PI/4);
            }
            popMatrix();
        } else if ( status < st4 ) {
            fill(red(ctype), green(ctype), blue(ctype), alpha*(st4-status)/(st4-st3));
            ellipse(x, y, d, d);
        } else if ( status == st4 ) {
            alBlast.remove(no);
        }

        status++;
    }
}

*/