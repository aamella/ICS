;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname proj-4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define carr (text "CAR" 200 "black"))
(define model (star 30 "solid" "yellow"))
(define (draw model) (place-image model 50 200 (place-image model 400 200 carr)))
(define (rot model x y event) (rotate 5 model))
(big-bang model
          (on-draw draw)
          (on-mouse rot))