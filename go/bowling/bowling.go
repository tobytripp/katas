package main

type Game struct {
	rolls []int
}

func NewGame() *Game {
	return &Game{
		rolls: make([]int, 0, 21),
	}
}

func (game *Game) Roll(pins int) {
	game.rolls = append(game.rolls, pins)
}

func (game Game) Score() int {
	return doScore(game.rolls)
}

func doScore(pins []int) int {
	if len(pins) <= 3 {
		return sum(pins)
	}
	x, y, z := pins[0], pins[1], pins[2]
	if x == 10 {
		return x + y + z + doScore(pins[1:])
	} else if x+y == 10 {
		return x + y + z + doScore(pins[2:])
	} else {
		return x + y + doScore(pins[2:])
	}
}

func sum(pins []int) int {
	score := 0
	for _, pin := range pins {
		score += pin
	}
	return score
}

func main() {}
