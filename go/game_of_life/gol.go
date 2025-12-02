package main

import (
	"fmt"
	"time"
)

type Universe [][]int

func NewUniverse(size int) Universe {
	universe := make(Universe, size)
	for i := range universe {
		universe[i] = make([]int, size)
	}
	return universe
}

func Step(u Universe) Universe {
	rows, cols := len(u), len(u[0])
	next := NewUniverse(rows)
	for i := 0; i < rows; i++ {
		for j := 0; j < cols; j++ {
			n := neighbors(u, i, j)
			switch n {
			case 2:
				if u[i][j] == 1 {
					next[i][j] = 1
				}
			case 3:
				next[i][j] = 1
			default:
				next[i][j] = 0
			}
		}
	}
	return next
}

func Display(u Universe) {
	for i := range u {
		for j := range u[i] {
			if u[i][j] == 1 {
				fmt.Print("█ ")
			} else {
				fmt.Print(". ")
			}
		}
		fmt.Println()
	}
}

func neighbors(u Universe, row, col int) int {
	count := 0
	rows, cols := len(u), len(u[0])

	for i := -1; i <= 1; i++ {
		for j := -1; j <= 1; j++ {
			if i == 0 && j == 0 {
				continue
			}

			r := (row + i + rows) % rows
			c := (col + j + cols) % cols

			if u[r][c] == 1 {
				count++
			}
		}
	}
	return count
}

func main() {
	universe := Universe{
		{0, 1, 0, 0, 0, 0},
		{0, 0, 1, 0, 0, 0},
		{1, 1, 1, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0},
	}

	for {
		fmt.Print("\033[H\033[2J") // Clear screen
		Display(universe)
		universe = Step(universe)
		time.Sleep(100 * time.Millisecond)
	}
}
