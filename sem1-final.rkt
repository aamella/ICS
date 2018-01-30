;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname sem1-final) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;WRITTEN RESPONSE
;No. 2
;  p.1) Shelly said that a mouse handler has a string (event) followed by two numbers (mouse-x and mouse-y)
;       but mouse handlers have the mouse coordinates first
;  p.2) mouse-h: model(old) number number string -> model(new)
;
;No. 3
;  p.1) The model in a big-bang
;  p.2) This is useful because a big-bang can have a large variety of types for a model, so the any type is useful
;
;No. 4
;  p.1) The roll-dice function adds two random numbers between 0 and 9
;  p.2) (define (roll-dice-fixed d1 d2)
;               (+ 2 d1 d2)) //2 is because random starts at 0, so it should always add 2 to compensate
;       (check-expect (roll-dice-fixed 5 5)
;                     12) //because it would take in a (random 10) which would each return 5, then add 2 to make it legit
;       (check-expect (roll-dice-fixed 0 0)
;                     2) //example of when the +2 is actually needed.

;PROGRAMMING QUESTIONS
(require picturing-programs)
;signature: sudo-roman; number -> string
;purpose: change each number in the 100s place to a c, each in the tens place to an X and each in the ones to an I
(define (sudo-roman x)
  (string-append (substring "CCCCCCCCC"  0 (string->number (substring (number->string (min 999 x))
                                                   0 1)))
                 (substring "XXXXXXXXX"  0 (string->number (substring (number->string (min 999 x))
                                                   1 2)))
                 (substring "IIIIIIIII"  0 (string->number (substring (number->string (min 999 x))
                                                   2 3)))))
(check-expect (sudo-roman 111)
              "CXI")
(check-expect (sudo-roman 100)
              "C") ;checking that 0s work
;PROBLEM 2
(define-struct p2 (mx my cx cy si sc)) ;p2 = 'Problem 2'
;mx - mouse x coord
;my - mouse y coord
;cx - red circle x coord
;cy - red circle y coord
;si - size of red circle (0,10,20,30,40,50)
;sc - score
(define START (make-p2 0 0 0 0 0 0)) ;starting model
(define BACKGROUND (empty-scene 500 500))
(define (make-random-red-dot p2) ;helper for randomizing red dot posn after it hits 0
  (make-p2 (p2-mx p2)
           (p2-my p2)
           (random 501)
           (random 501)
           50 (p2-sc p2)))
;signature: tick-h; model(old) -> model(new)
;purpose: change size of red circle and randomize its location when needed
(define (tick-h p2)
  (cond [(= 0 (p2-si p2))
         (make-random-red-dot p2)]
        [else (make-p2
               (p2-mx p2)
               (p2-my p2)
               (p2-cx p2)
               (p2-cy p2)
               (- (p2-si p2)
                 10)
               (cond [(mouse-hit-dot? p2)
                  (+ 1 (p2-sc p2))]
                 [else (p2-sc p2)]))]))
(define (distance-formula p2) ;measures distance between mouse&circle
  (sqrt (+ (sqr (- (p2-mx p2)
                (p2-cx p2)))
        (sqr (- (p2-my p2)
                (p2-cy p2))))))
(define (mouse-hit-dot? p2) ;helper that returns boolean if mouse hits red circle. using square hitbox b/c I dont know trig
  (> (+ 10 (* .5 (p2-si p2)))
  (distance-formula p2)))
;signature: mouse-h; model(old) number number string(unused) -> model(new)
;purpose: update small blue dot & register if player has scored
(define (mouse-h p2 x y e)
  (make-p2 x y (p2-cx p2)
           (p2-cy p2)
           (p2-si p2)
           (p2-sc p2)))
(check-expect (mouse-h START 5 5 "")
              (make-p2 5 5 0 0 0 0))
;signature: draw-h; model -> image
;purpose; place small blue dot & red dot & score
(define (draw-h p2)
  (place-image (circle 5 "solid" "blue")
               (p2-mx p2)
               (p2-my p2)
               (place-image (circle (p2-si p2)
                                    "solid"
                                    "red")
                            (p2-cx p2)
                            (p2-cy p2)
                            (overlay/align "right" "top" (text (number->string (p2-sc p2))
                                                                               20 "black")
                                           BACKGROUND))))
(big-bang START
          (on-draw draw-h)
          (on-tick tick-h 1)
          (on-mouse mouse-h))