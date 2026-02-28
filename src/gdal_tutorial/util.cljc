(ns gdal-tutorial.util)

(defn pprint
  "hacks until clojure.pprint is ported"
  ([m] (pprint m 0))
  ([m indent]
   (let [spaces (apply str (repeat indent " "))]
     (cond
       (map? m)
       (do
         (println (str spaces "{"))
         (doseq [[k v] m]
           (print (str spaces "  " k " "))
           (if (or (map? v) (sequential? v))
             (do (println) (pprint v (+ indent 2)))
             (println (pr-str v))))
         (println (str spaces "}")))

       (sequential? m)
       (do
         (println (str spaces "["))
         (doseq [item m]
           (if (or (map? item) (sequential? item))
             (pprint item (+ indent 2))
             (println (str spaces "  " (pr-str item)))))
         (println (str spaces "]")))

       :else (println (str spaces (pr-str m)))))))

(defn fib-seq
  "Generates an infinite lazy sequence of Fibonacci numbers."
  ([]
   (fib-seq 0 1))
  ([a b]
   (lazy-seq
    (cons a (fib-seq b (+ a b))))))

(take 10 (fib-seq))
