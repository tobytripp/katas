(ns game-of-life.core
  "This can be done more succinctly as a Set of live coordinates, but I
  didn't want to go that way."
  (:gen-class)
  (:require [clojure.pprint :as pp]))

(defn neighboring-coords [x y]
  (for [dx [-1 0 1]
        dy (if (zero? dx) [-1 1] [-1 0 1])]
    [(+ dx x) (+ dy y)]))

(defn nth-wrapped
  "Like nth, but wrapping around boundaries"
  [coll index]
  (let [i (cond
            (= index -1)           (dec (count coll))
            (= index (count coll)) 0
            :else                  index)]
    (nth coll i)))

(defn neighbor-count [universe x y]
  (apply + (map (fn [[i j]] (-> universe
                              (nth-wrapped i)
                              (nth-wrapped j)))
                (neighboring-coords x y))))


(defn step
  "Step the GoL universe one tick and return the new universe"
  [universe]
  (map-indexed (fn [x row]
                 (map-indexed
                  (fn [y cell]
                    (let [n (neighbor-count universe x y)]
                      (if (or (= n 3) (and (= n 2) (= 1 cell))) 1 0)))
                  row))
               universe))

(defn -main []
  (let [universe [[0 1 0 0 0 0]
                  [0 0 1 0 0 0]
                  [1 1 1 0 0 0]
                  [0 0 0 0 0 0]
                  [0 0 0 0 0 0]
                  [0 0 0 0 0 0]]]
    (pp/pprint (take 5 (iterate step universe)))))
