;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname minesweeper) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define BOARD (list (list 0 0 0 0 0 0 0 0)
                    (list 0 0 0 0 0 0 0 0)
                    (list 0 0 0 0 0 0 0 0)
                    (list 0 0 0 0 0 0 0 0)
                    (list 0 0 0 0 0 0 0 0)
                    (list 0 0 0 0 0 0 0 0)
                    (list 0 0 0 0 0 0 0 0)
                    (list 0 0 0 0 0 0 0 0)))
;(0,0) (1,0) (2,0)  And
;(0,1) (1,1) (2,1)  so
;(0,2) (1,2) (2,2)  on
(define (spot x l)
  (cond [(= x 0)
         (first l)]
        [(= x 1)
         (second l)]
        [(= x 2)
         (third l)]
        [(= x 3)
         (fourth l)]
        [(= x 4)
         (fifth l)]
        [(= x 5)
         (sixth l)]
        [(= x 6)
         (seventh l)]
        [(= x 7)
         (eighth l)]
        [else
         (error "x not between 0 and 8")]))
(define (rand-spot x)
  (make-posn (random 8)
             (random 8)))
(define (check-spot b x)
  (spot (posn-x x)
        (spot (posn-y x)
              b)))
(define (list-change s o n)
  (cond [(= s 0)
         (list n (second o)
               (third o)
               (fourth o)
               (fifth o)
               (sixth o)
               (seventh o)
               (eighth o))]
        [(= s 1)
         (list (first o)
               n
               (third o)
               (fourth o)
               (fifth o)
               (sixth o)
               (seventh o)
               (eighth o))]
        [(= s 2)
         (list (first o)
               (second o)
               n
               (fourth o)
               (fifth o)
               (sixth o)
               (seventh o)
               (eighth o))]
        [(= s 3)
         (list (first o)
               (second o)
               (third o)
               n
               (fifth o)
               (sixth o)
               (seventh o)
               (eighth o))]
        [(= s 4)
         (list (first o)
               (second o)
               (third o)
               (fourth o)
               n
               (sixth o)
               (seventh o)
               (eighth o))]
        [(= s 5)
         (list (first o)
               (second o)
               (third o)
               (fourth o)
               (fifth o)
               n
               (seventh o)
               (eighth o))]
        [(= s 6)
         (list (first o)
               (second o)
               (third o)
               (fourth o)
               (fifth o)
               (sixth o)
               n
               (eighth o))]
        [(= s 7)
         (list n (second o)
               (third o)
               (fourth o)
               (fifth o)
               (sixth o)
               (seventh o)
               n)]))
(define (spot-change s b n)
  (list-change (posn-y s)
               b (list-change (posn-x s)
                              (spot (posn-y s) b)
                              n)))