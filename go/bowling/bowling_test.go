package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGutterGame(t *testing.T) {
	game := NewGame()
	for range 20 {
		game = game.Roll(0)
	}

	assert.Equal(t, game.Score(), 0, "Expected gutter game to score zero")
}

func TestAllOnes(t *testing.T) {
	game := NewGame()
	for range 20 {
		game = game.Roll(1)
	}

	assert.Equal(t, 20, game.Score())
}

func TestSingleSpare(t *testing.T) {
	game := NewGame()
	game = game.Roll(5)
	game = game.Roll(5)
	game = game.Roll(3)
	for i := 3; i < 20; i++ {
		game = game.Roll(0)
	}

	assert.Equal(t, game.Score(), 16)
}

func TestAllSpares(t *testing.T) {
	game := NewGame()
	for range 21 {
		game = game.Roll(5)
	}

	assert.Equal(t, game.Score(), 150)
}
