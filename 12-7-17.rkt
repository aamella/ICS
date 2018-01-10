;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 12-7-17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define (carpet-price x)
  (cond [(=> x 500) (* .8 (* x 5))]
        [(=> x 100) (* .9 (* x 5))]
        [else (* x 5)]))
(define (digital-thermometer x)
  (cond [(< x 99) (text (number->string x) 10 "green")]
        [(> x 101) (text (number->string x) 10 "red")]
        [else (text (number->string x) 10 "yellow")]))
(define (letter-grade x)
  (cond [(> x 100) "A"]
        [(> x 90) "B"]
        [(> x 80) "C"]
        [(> x 70) "D"]
        [else "F"]))
(define (who-won x y z)
  (cond [(and (< x y) (< x z)) 1]
        [(and (< y z) (< y x)) 2]
        [(and (< z y) (< z x)) 3]
        [else "tie"]))