(ns rna-transcription
  (:require [clojure.string :as str]))

(def dna-to-rna
  {\G \C
   \C \G
   \T \A
   \A \U})

(defn- convert [nuc]
  (let [rna (dna-to-rna nuc)]
    (if (nil? rna)
      (throw (AssertionError. "Invalid nucleotide"))
      rna)))

(defn to-rna [strand]
  (str/join "" (map convert strand)))
