(ns bob
  (:require [clojure.string :as str]))

(defn- exclamation? [input]
  (and
   (= input (str/upper-case input))
   (not (= input (str/lower-case input)))))

(defn- silence? [input]
  (str/blank? input))

(defn- question? [input]
  (= \? (last input)))

(defn response-for [input]
  (cond
    (exclamation? input) "Whoa, chill out!"
    (silence? input) "Fine. Be that way!"
    (question? input) "Sure."
    :else "Whatever."))
