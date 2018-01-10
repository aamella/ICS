;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9-19-17-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define c (circle 50 "outline" "purple"))
(define c2 (ellipse 40 30 "solid" "black"))
(define c3 (ellipse 60 40 "solid" "yellow"))
(define c4 (ellipse 80 50 "solid" "green"))
(define final (overlay c (overlay c2 (overlay c3 c4))))