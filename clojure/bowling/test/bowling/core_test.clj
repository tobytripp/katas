(ns bowling.core-test
  (:require [clojure.test :refer :all]
            [bowling.core :refer :all]))

(deftest bowling-test
  (testing "Gutter game"
    (let [rolls (repeat 20 0)]
      (is (= 0 (score rolls)))))
  (testing "All ones"
    (let [rolls (repeat 20 1)]
      (is (= 20 (score rolls)))))
  (testing "One Spare"
    (let [rolls (concat [5 5 3] (repeat 17 0))]
      (is (= 16 (score rolls)))))
  (testing "One Strike"
    (let [rolls (concat [10 3 4] (repeat 16 0))]
      (is (= 24 (score rolls)))))
  (testing "Perfect Game"
    (let [rolls (repeat 12 10)]
      (is (= 300 (score rolls)))))
  (testing "Alternating Strike Spare"
    (let [rolls [10 5 5  10 5 5  10 5 5  10 5 5  10 5 5  10]]
      (is (= 200 (score rolls)))))
  (testing "Alternating Spare Strike"
    (let [rolls [5 5  10 5 5  10 5 5  10 5 5  10 5 5  10 5 5]]
      (is (= 200 (score rolls))))))


