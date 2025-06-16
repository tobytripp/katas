#include "bowling.h"

static int calculate_score(const int rolls[], int frameIndex, int frame) {
    if (frame == 10) {
        return 0;
    }
    
    if (rolls[frameIndex] == 10) {
        return 10 + rolls[frameIndex + 1] + rolls[frameIndex + 2] + 
               calculate_score(rolls, frameIndex + 1, frame + 1);
    }
    else if (rolls[frameIndex] + rolls[frameIndex + 1] == 10) {
        return 10 + rolls[frameIndex + 2] + 
               calculate_score(rolls, frameIndex + 2, frame + 1);
    }
    else {
        return rolls[frameIndex] + rolls[frameIndex + 1] + 
               calculate_score(rolls, frameIndex + 2, frame + 1);
    }
}

int score(const int rolls[]) {
    return calculate_score(rolls, 0, 0);
}
