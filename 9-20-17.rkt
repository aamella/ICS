;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9-20-17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define c (circle 40 "outline" "blue"))
(define r (rotate 20 (rectangle 75 5 "solid" "siuvbdufv")))
(overlay r c)

(define el (ellipse 50 200 "solid" "pink"))
(define s (rectangle 100 100 "solid" "blue"))
(beside/align "top" el s)
(beside/align "bottom" el s)

