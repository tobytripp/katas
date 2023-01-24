(ns bowling.core)

(defn score [[x y z & rolls]]
  (cond
    (nil? x)       0
    (nil? z)       (+ x y)
    (empty? rolls) (+ x y z)
    (= 10 x)       (+ x y z (score (concat [y z] rolls)))
    (= 10 (+ x y)) (+ x y z (score (concat [z] rolls)))
    :else          (+ x y   (score (concat [z] rolls)))))
