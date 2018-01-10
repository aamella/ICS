;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10-30-17-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define model (empty-scene 500 500))
(define (dot model) (place-image (circle 10 "solid" "blue") (random 500) (random 500) model))
(big-bang model
          (on-draw show-it)
          (on-tick dot .001))