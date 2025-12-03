package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestGutterGame(t *testing.T) {
	game := NewGame()
	for range 20 {
		game.Roll(0)
	}

	assert.Equal(t, game.Score(), 0, "Expected gutter game to score zero")
}

func TestAllOnes(t *testing.T) {
	game := NewGame()
	for range 20 {
		game.Roll(1)
	}

	assert.Equal(t, 20, game.Score())
}

func TestSingleSpare(t *testing.T) {
	game := NewGame()
	game.Roll(5)
	game.Roll(5)
	game.Roll(3)
	for i := 3; i < 20; i++ {
		game.Roll(0)
	}

	assert.Equal(t, 16, game.Score())
}

func TestAllSpares(t *testing.T) {
	game := NewGame()
	for range 21 {
		game.Roll(5)
	}

	assert.Equal(t, game.Score(), 150)
}

func TestStrike(t *testing.T) {
	game := NewGame()
	game.Roll(10)
	game.Roll(3)
	game.Roll(4)
	for range 16 {
		game.Roll(0)
	}

	assert.Equal(t, 24, game.Score())
}

func TestFrameSpares(t *testing.T) {
	game := NewGame()
	for range 10 {
		game.Roll(8)
		game.Roll(2)
	}
	game.Roll(3)

	assert.Equal(t, 175, game.Score())
}

func TestPerfectGame(t *testing.T) {
	game := NewGame()
	for range 12 {
		game.Roll(10)
	}

	assert.Equal(t, 300, game.Score())
}
