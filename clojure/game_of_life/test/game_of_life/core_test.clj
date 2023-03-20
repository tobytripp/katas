(ns game-of-life.core-test
  (:require [clojure.test :refer :all]
            [game-of-life.core :refer :all]))

(deftest nth-wrapped-test
  (let [v [1 2 3]]
    (is (= 1 (nth-wrapped v 0)))
    (is (= 3 (nth-wrapped v -1)))
    (is (= 1 (nth-wrapped v 3)))))

(deftest step-test
  (comment testing "empty cells"
    (let [universe [[0 0 0]
                    [0 0 0]
                    [0 0 0]]]
      (is (= universe (step universe)))))
  (comment testing "any live cell with fewer than two neighbors dies as if by underpopulation"
    (let [universe [[1 0 0]
                    [0 0 0]
                    [0 0 0]]]
      (is (=  [[0 0 0]
               [0 0 0]
               [0 0 0]]
              (step universe)))))
  (testing "any live cell with two neighbors survives"
    (let [universe [[0 0 0 0 0]
                    [0 1 1 1 0]
                    [0 0 0 0 0]
                    [0 0 0 0 0]]]
      (is (= [[0 0 1 0 0]
              [0 0 1 0 0]
              [0 0 1 0 0]
              [0 0 0 0 0]]
             (step universe)))))
  (testing "any live cell with three neighbors survives"
    (let [universe [[0 0 0 0 0]
                    [0 1 1 1 0]
                    [0 0 1 0 0]
                    [0 0 0 0 0]]]
      (is (= [[0 0 1 0 0]
              [0 1 1 1 0]
              [0 1 1 1 0]
              [0 0 0 0 0]]
             (step universe)))))
  (testing "any dead cell with exactly three neighbors becomes live"
    (let [universe [[1 0 1 0]
                    [0 1 0 0]
                    [0 0 0 0]
                    [0 0 0 0]]]
      (is (= [[0 1 0 0]
              [0 1 0 0]
              [0 0 0 0]
              [0 0 0 0]]
             (step universe)))))
  (testing "glider"
    (let [universe [[0 1 0 0 0 0]
                    [0 0 1 0 0 0]
                    [1 1 1 0 0 0]
                    [0 0 0 0 0 0]
                    [0 0 0 0 0 0]
                    [0 0 0 0 0 0]]]
      (is (= [[0 0 0 0 0 0]
              [1 0 1 0 0 0]
              [0 1 1 0 0 0]
              [0 1 0 0 0 0]
              [0 0 0 0 0 0]
              [0 0 0 0 0 0]]
             (step universe))))))
