;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 12-12-17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define (simplify-me x y)
  (cond [(< x 20)
         (cond [(not (number? y)) false]
               [else true])]
        [(> x 50)
         (cond [(string? y) true]
               [else false])]))

(define (simplify-me-no-cond x y)
  (or (and (< x 20) (number? y))
      (and (> x 50) (string? y))))

;A=Air
;M=Mushroom
;A A A A A A
;A M M M M M
;A M M M M M
;A A A A M M
;A A A A M M
;character is 1 box
;when the character's head touches the box, it is hit.
;each box is 20x20
;muchroom config is pre set
(define (hit-head? character-y character-x)
  (and (< character-y 60)
       (> character-x 20)))
(define (make-marble color)
  (cond [(string=? color "blue")
         (overlay (text (substring color 0 1)
                        20 "black")
                  (circle 15 "solid" "blue"))]
        [(string=? color "red")
         (overlay (text (substring color 0 1)
                        20 "black")
                  (circle 20 "solid" color))]
        [(string=? color "green")
         (overlay (text (substring color 0 1)
                        20 "black")
                  (circle 30 "solid" color))]
        [else (overlay (text (substring color 0 1)
                             20 "black")
                       (circle 40 "solid" color))]))

(define (marble-stacker m1 m2 m3 m4)
  (above (make-marble m1)
         (make-marble m2)
         (make-marble m3)
         (make-marble m4)))
(define (pretty-butterfly name)
  (text (string-append (substring name 0 (- (string-length name)
                                            4))
                       "   -   "
                       (substring name (- (string-length name)
                                          4)
                                  (string-length name)))
        20 (cond [(< (string->number (substring name (- (string-length name)
                                                        4)
                                                (string-length name))) 0.1)
                  "red"]
                 [(< (string->number (substring name (- (string-length name)
                                                        4)
                                                (string-length name))) 1)
                  "orange"]
                 [else "green"])))