int score(const int rolls[]) {
    int total = 0;
    int roll_index = 0;
    
    for (int frame = 0; frame < 10; frame++) {
        if (rolls[roll_index] + rolls[roll_index + 1] == 10) {
            // Spare: add 10 plus the next roll as bonus
            total += 10 + rolls[roll_index + 2];
            roll_index += 2;
        } else {
            // Normal frame: just add the two rolls
            total += rolls[roll_index] + rolls[roll_index + 1];
            roll_index += 2;
        }
    }
    
    return total;
}