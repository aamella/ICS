;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10-18-17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define (cir x) (* pi 2 x))
(define (doc-mo-has-weird-groceries g b) (+ (* 1.49 g) (* .59 b)))
(define (at-most-250 x) (min x 250))
(define (small-0 x y) (min (abs x) (abs y)))
(define (random-3 x) (- 50 (random 101)))
(define (random-4 x) (* 2 (random 101)))