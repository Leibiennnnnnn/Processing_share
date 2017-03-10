void detectThreshold(PImage source, PImage target, color c) {
    int x = 200;
    boolean btopset = false;
    boolean bcorrect = false;

    color cs;

    source.loadPixels();

    for (int y = 0; y < height; y++) {
        int p = x + width*y;
        cs = color(source.pixels[p]);

        if ( cs == c ) {
            bcorrect = true;
            target.pixels[p] = color(255, 0, 0);
            bottom = y;
            if ( !btopset ) {
                top = y;
                btopset = true;
            }
        } else {
            bcorrect = false;
        }

        //println(red(cs), green(cs), blue(cs), y, p, bcorrect);
    }
    
    bottom += 1;
    target.updatePixels();
    println(top, bottom);
}