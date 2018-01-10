;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname proj-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
;1
(define (moveup model key) (above (rectangle 5 5 "solid" "white") model))
(define model (rectangle 100 100 "solid" "purple"))
(define (draw model) (moveup model 1))
(big-bang model
          (on-draw draw)
          (on-key moveup))