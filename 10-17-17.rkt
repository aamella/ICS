;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10-17-17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define (hyp a b) (sqrt (+ (sqr a) (sqr b))))
(define (slope x1 y1 x2 y2) (/ (- y2 y1) (- x2 x1) )) 
(define (dist x1 y1 x2 y2) (hyp (- x2 x1) (- y2 y1)))
(define (quad a b c) (/ (+ (- b) (sqrt (- (sqr b) (* 4 a c)))) (* 2 a)))
(define back (circle 150 "solid" "white"))
(define t2 (overlay (circle 100 "outline" "black") back))
(define t3 (place-image (circle 20 "solid" "black") 150 50 t2))  