;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10-31-17-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define (place x) (place-image (circle 5 "solid" "blue") x (- (* 2 x) 30) (empty-scene 150 150)))
(define (trace x) (cond
                    [(= x 100) 0]
                    [else (add1 x)]))
(big-bang 0
          (on-tick trace)
          (on-draw place))