;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 12-11-17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define (short-between? x)
  (and (<= (string-length x) 6)
       (and (string>? x "good luck")
            (string<? x "quiz"))))
(define (beautiful-gpa x)
  (cond [(> x 4.5) (text (number->string (exact->inexact x)) 10 "green")]
        [(>= x 3.5) (text (number->string (exact->inexact x)) 10 "orange")]
        [(>= x 2.5) (text (number->string (exact->inexact x)) 10 "purple")]
        [(>= x 1.5) (text (number->string (exact->inexact x)) 10 "red")]
        [else (text (number->string x) 10 "magenta")]))
(define (tryhardio shoot speed tele)
  (cond [(> (+ (* 150 shoot) (* 200 speed) (* 400 tele)) 600) (* .8 (+ (* 150 shoot) (* 200 speed) (* 400 tele)))]
        [(> (+ (* 150 shoot) (* 200 speed) (* 400 tele)) 400) (* .9 (+ (* 150 shoot) (* 200 speed) (* 400 tele)))]
        [else (+ (* 150 shoot) (* 200 speed) (* 400 tele))]))