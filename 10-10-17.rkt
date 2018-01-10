;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10-10-17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define (rect x) (overlay/align "middle" "bottom" (rotate 45 (square x "solid" "black")) (rectangle 100 100 "solid" "yellow")))
(define x 10)
;(big-bang (rect 10)
     ;     (on-draw (rect 10))
     ;    (on-tick (rect (+ x 5))))
;to make a pentagon grow
;(penta-grow num) > image
;to place the pentagon on the background
(define (penta-grow x) (place- (scale x (regular-polygon 5 20 "solid" "red")) (rectangle 200 200 "solid" "gray")))
