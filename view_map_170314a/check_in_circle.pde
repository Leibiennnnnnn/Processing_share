Boolean checkInCircle(float x2, float y2, float x1, float y1, float d) {
    Boolean result = false;
    if ( dist(x2, y2, x1, y1) <= d/2 ) {
        result = true;
    }
    return result;
}