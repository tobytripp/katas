package main

import (
	"slices"
	"testing"
)

func universesEqual(a, b Universe) bool {
	for i, row := range b {
		if !slices.Equal(a[i], row) {
			return false
		}
	}
	return true
}

func TestEmptyCells(t *testing.T) {
	universe := Universe{
		{0, 0, 0},
		{0, 0, 0},
		{0, 0, 0},
	}

	next := Step(universe)
	if !universesEqual(universe, next) {
		t.Fatal("Expected empty universe to stay empty")
	}
}

func TestLiveCellWithFewerThanTwoNeighborsDies(t *testing.T) {
	universe := Universe{
		{1, 0, 0},
		{0, 0, 0},
		{0, 0, 0},
	}
	expected := Universe{
		{0, 0, 0},
		{0, 0, 0},
		{0, 0, 0},
	}

	next := Step(universe)
	if !universesEqual(expected, next) {
		t.Fatalf("Expected cell to starve %v -> %v", expected, next)
	}
}

func TestLiveCellWithTwoNeighborsLives(t *testing.T) {
	universe := Universe{
		{1, 1, 0, 0},
		{0, 0, 1, 0},
		{0, 0, 0, 0},
		{0, 0, 0, 0},
	}
	expected := Universe{
		{0, 1, 0, 0},
		{0, 1, 0, 0},
		{0, 0, 0, 0},
		{0, 0, 0, 0},
	}

	next := Step(universe)
	if !universesEqual(expected, next) {
		t.Fatalf("Expected cell to live %v -> %v", expected, next)
	}
}

func TestLiveCellWithThreeNeighborsLives(t *testing.T) {
	universe := Universe{
		{1, 0, 1, 0, 0},
		{0, 1, 0, 0, 0},
		{0, 1, 0, 0, 0},
		{0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0},
	}
	expected := Universe{
		{0, 1, 0, 0, 0},
		{1, 1, 1, 0, 0},
		{0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0},
	}

	next := Step(universe)
	if !universesEqual(expected, next) {
		t.Fatalf("Expected cell to live %v -> %v", expected, next)
	}
}

func TestDeadCellWithThreeNeighborsLives(t *testing.T) {
	universe := Universe{
		{1, 0, 1, 0},
		{0, 1, 0, 0},
		{0, 0, 0, 0},
		{0, 0, 0, 0},
	}
	expected := Universe{
		{0, 1, 0, 0},
		{0, 1, 0, 0},
		{0, 0, 0, 0},
		{0, 0, 0, 0},
	}

	next := Step(universe)
	if !universesEqual(expected, next) {
		t.Fatalf("Expected cell to be born %v -> %v", expected, next)
	}
}
