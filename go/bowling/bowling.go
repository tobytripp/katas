package main

type Game struct {
	Rolls []int
}

func NewGame() Game {
	game := Game{
		Rolls: make([]int, 20),
	}
	return game
}

func (game Game) Roll(pins int) Game {
	game.Rolls = append(game.Rolls, pins)
	return game
}

func (game Game) Score() int {
	return doScore(game.Rolls)
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
	for p := range len(pins) {
		score += pins[p]
	}
	return score
}

func main() {}
