;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 12-8-17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define (size x)
  (cond [(image? x) (* (image-height x) (image-width x))]
        [(number? x) (abs x)]
        [(string? x) (string-length x)]
        [else "Not an image, number or string"]))
(define (big? x)
  (cond [(number? x) (if [(> x 1000)])]
        [