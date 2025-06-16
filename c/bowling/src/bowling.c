#include "bowling.h"

int score(const int rolls[]) {
    int score = 0;
    int frameIndex = 0;
    
    for (int frame = 0; frame < 10; frame++) {
        if (rolls[frameIndex] == 10) {
            // Strike
            score += 10 + rolls[frameIndex + 1] + rolls[frameIndex + 2];
            frameIndex += 1;
        } else if (rolls[frameIndex] + rolls[frameIndex + 1] == 10) {
            // Spare
            score += 10 + rolls[frameIndex + 2];
            frameIndex += 2;
        } else {
            // Open frame
            score += rolls[frameIndex] + rolls[frameIndex + 1];
            frameIndex += 2;
        }
    }
    
    return score;
}
