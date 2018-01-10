;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9-29-17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define (cheese X) (beside (beside/align "bottom" (rectangle 100 50 "solid" "yellow") (rectangle 200 100 "solid" "yellow")) X))
(define (boom X) (beside (scale .5 X) X (scale 2 X) (text "BOOM" 50 "black")))