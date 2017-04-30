//This is the animation of small fireworks

///*

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

        d = 10 + 40 * tf * 0.01;
        r = d/2;
        alpha = 10 + 245 * tf * 0.01;
        angle = random(PI/6);
        st1 = int( 6*(1+tf*0.01) );
        st2 = st1 + int( st1*0.5 );
        st3 = st2 + 4;
        st4 = st3 + 4;

        //va = -2;
        //va = -1.5-(120-tf)*0.01;
    }

    void display() {

        noFill();
        stroke(red(ctype), green(ctype), blue(ctype), alpha);

        if ( status < st1 ) {
            strokeWeight(5);
            ellipse(x, y, d*status/st1, d*status/st1);
        } else if ( status < st2 ) {
            strokeWeight(5);
            ellipse(x, y, d, d);
            pushMatrix();
            noStroke();
            fill(red(ctype), green(ctype), blue(ctype), alpha);
            translate(x, y);
            rotate(angle);
            for ( int i=0; i<6; i++ ) {
                ellipse(r+r/(st2-st1)*(status-st1), 0, d*0.1/(st2-st1)*(status-st1), d*0.1/(st2-st1)*(status-st1));
                rotate(PI/3);
            }
            rotate(PI/6);
            for ( int i=0; i<6; i++ ) {
                ellipse(r+r/(st2-st1)*(status-st1), 0, d*0.1/(st2-st1)*(status-st1), d*0.1/(st2-st1)*(status-st1));
                rotate(PI/3);
            }
            popMatrix();
        } else if ( status < st3 ) {
            strokeWeight(5);
            ellipse(x, y, d, d);
            pushMatrix();
            noStroke();
            fill(red(ctype), green(ctype), blue(ctype), alpha);
            translate(x, y);
            rotate(angle);
            for ( int i=0; i<6; i++ ) {
                ellipse(r*2, 0, d*0.1, d*0.1);
                rotate(PI/3);
            }
            rotate(PI/6);
            for ( int i=0; i<6; i++ ) {
                ellipse(r*2+r*0.5/(st3-st2)*(status-st2), 0, d*0.1, d*0.1);
                rotate(PI/3);
            }
            popMatrix();
        } else if ( status < st4 ) {
            strokeWeight(5);
            ellipse(x, y, d, d);
        } else if ( status == st4 ) {
            alBlast.remove(no);
        }

        status++;
    }
}

//*/