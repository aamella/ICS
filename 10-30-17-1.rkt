;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10-30-17-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define triangleeee (triangle 50 "solid" "orange"))
(define (place x) (place-image
                   triangleeee 50 (* x 50) (empty-scene 400 400)))
(define x 1)
(define (loop x) (cond [(= x 1) 2]
                       [(= x 2) 3]
                       [(= x 3) 1]))
(define (key x key) (+ (random 3) 1))
(big-bang 1
          (on-draw place)
          (on-tick loop 1)
          (on-key key))
          