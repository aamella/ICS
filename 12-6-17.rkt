;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 12-6-17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define (make-stripes x y) (cond [(integer? (/ y 2)) "purple"]
                                 [else "blue"]))
(build-image 1000 1000 make-stripes)
(define (make-x-stripes str x y)
  (scale str (build-image 1000 1000 make-stripes)))