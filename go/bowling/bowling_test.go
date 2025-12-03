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

func TestStrike(t *testing.T) {
	game := NewGame()
	game = game.Roll(10)
	game = game.Roll(3)
	game = game.Roll(4)
	for range 16 {
		game = game.Roll(0)
	}

	assert.Equal(t, 24, game.Score())
}

func TestFrameSpares(t *testing.T) {
	game := NewGame()
	for range 10 {
		game = game.Roll(8)
		game = game.Roll(2)
	}
	game = game.Roll(3)

	assert.Equal(t, 175, game.Score())
}
