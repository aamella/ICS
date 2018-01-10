;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10-12-17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define model pic:bloch)
(define (pic x) (overlay x (rectangle 300 300 "solid" "white")))
(define (follow aaa) (place-image aaa x y (rectangle 300 300 "solid" "white")))
(big-bang model
          (on-draw pic)
          (on-mouse motion (follow)))