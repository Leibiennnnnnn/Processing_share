void detectLine(PImage source, PImage target, color c) {
    float h1 = hue(c);
    float s1 = saturation(c);
    float b1 = brightness(c);

    float minH = h1 - 20;
    float maxH = h1 + 20;
    float minB = b1 - 10;
    float maxB = b1 + 10;
    float minS = s1 - 10;
    float maxS = s1 + 10;

    float h, s, b;

    boolean bcorrect = false;
    int pos = -1;
    float postrans = -1;

    color cs;

    source.loadPixels();

    for (int x = 375; x < 1875; x += 5) {
        bcorrect = false;
        pos = -1;
        postrans = -1;

        for (int y = 0; !bcorrect && y < height; y++) {
            int p = x + width*y;

            cs = color(source.pixels[p]);
            h = hue(source.pixels[p]);
            s = saturation(source.pixels[p]);
            b = brightness(source.pixels[p]);

            if ( h >= minH && h <= maxH && b >= minB && b <= maxB && s >= minS && s <= maxS ) {
                bcorrect = true;
                target.pixels[p] = color(255, 0, 0);
                pos = y;
                if ( pos > -1 ){
                    if ( pos < top ){
                        pos = top;
                    } else if ( pos > bottom) {
                        pos = bottom;
                    }
                }
                postrans = map(pos, top, bottom, 100, 0);
            }
        }
        println(x, pos, postrans, bcorrect);
    }

    target.updatePixels();
}