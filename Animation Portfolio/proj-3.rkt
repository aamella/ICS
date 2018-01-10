;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname proj-3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define (draw model) (above model (rectangle 150 1800 "solid" "green")))
(define (tick model) (crop-bottom model 1))
(define model (circle 75 "solid" "yellow"))
(big-bang model
          (on-draw draw)
          (on-tick tick))