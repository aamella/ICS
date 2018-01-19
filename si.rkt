(require picturing-programs)
(define-struct si (ex ey tx bulx buly bomx bomy edir))
;ex   - enemy X
;ey   - enemy Y
;tx   - turret X
;bulx - bullet x
;buly - bullet Y
;bomx - bomb X
;bomy - bomb Y
;edir - enemy direction (+/- 1)
;GAME ELEMENTS
(define BACKGROUND (empty-scene 500 500))
(define BULLET (rectangle 2 30 "solid" "blue"))
(define TURRET (above (rectangle 6 2 "solid" "black")
                      (rectangle 50 20 "solid" "green")))
(define ENEMY (ellipse 50 20 "solid" "red"))
(define BOMB (circle 5 "solid" "red"))
(define START (make-si 15 5 25 1000 1000 1000 1000 1))
(define (limit x)
  (max (min x 500)
       0))
(define (game-over si)
  (cond [(bullet-hit-enemy? si)
         (text "BULLET HIT ENEMY" 50 "green")]
        [(enemy-hit-turret? si)
         (text "ENEMY HIT TURRET" 50 "red")]
        [(bomb-hit-turret? si)
         (text "BOMB HIT TURRET" 50 "red")]))
;LOGIC
(define (bullet-hit-enemy? si)
  (and (> (si-bulx si)
          (+ -25 (si-ex si))) ;bullet X greater than 25 left from enemy X
       (< (si-bulx si)
          (+ 25 (si-ex si))) ;bullet X less than 25 right from enemy X
       (< (si-buly si)
          (+ 30 (si-ey si))) ;bullet Y less than 10 below enemy Y
       (> (si-buly si)
          (+ -30 (si-ey si))))) ;bullet Y greater than than 10 above enemy Y
(define (enemy-hit-turret? si)
  (and (> (si-ey si)
          480)
       (or (< (+ -25 (si-ey si))
              (+ 25 (si-tx si)))
           (< (+ 25 (si-ey si))
              (+ -25 (si-tx si))))))
(define (bomb-hit-turret? si)
  (and (< (+ -25 (si-tx si))
          (si-bomx si))
       (> (+ 25 (si-tx si))
          (si-bomx si))
       (<= 490 (si-bomy si))))
(define (bullet-on-screen? si)
  (< -25 (si-buly si)))
(define (game-over? si)
  (or (enemy-hit-turret? si)
      (bomb-hit-turret? si)
      (bullet-hit-enemy? si)))
(define (enemy-left? si)
  (> 20 (si-ex si)))
(define (enemy-right? si)
  (< 480 (si-ex si)))
(define (bomb-on-screen? si)
  (< 500 (si-bomy si)))
;DRAW
(define (draw si)
  (place-image BOMB (si-bomx si)
               (si-bomy si)
               (place-image BULLET (si-bulx si)
                            (si-buly si)                
                            (place-image TURRET (si-tx si)
                                         490
                                         (place-image ENEMY (si-ex si)
                                                      (si-ey si)
                                                      BACKGROUND)))))
;TICK
(define (bomb-tick si)
  (make-si (si-ex si)
           (si-ey si)
           (si-tx si)
           (si-bulx si)
           (si-buly si)
           (si-bomx si)
           (+ 10 (si-bomy si))
           (si-edir si)))
(define (bullet-tick si)
  (make-si (si-ex si)
           (si-ey si)
           (si-tx si)
           (si-bulx si)
           (+ -20 (si-buly si))
           (si-bomx si)
           (si-bomy si)
           (si-edir si)))
(define (enemy-tick si)
  (make-si (cond [(= (si-edir si) 1)
                  (+ 10 (si-ex si))]
                 [(= (si-edir si) -1)
                  (+ -10 (si-ex si))]
                 [else (error "What the actual fuck how did you break this")])
           (cond [(or (enemy-left? si) (enemy-right? si))
                  (+ (si-ey si) 10)]
                 [else (si-ey si)])
           (si-tx si)
           (si-bulx si)
           (si-buly si)
           (cond [(bomb-on-screen? si) (si-ex si)]
                 [else (si-bomx si)])
           (cond [(bomb-on-screen? si) (si-ey si)]
                 [else (si-bomy si)])
           (cond [(enemy-left? si) 1]
                 [(enemy-right? si) -1]
                 [else (si-edir si)])))
(define (tick si)
  (enemy-tick (bullet-tick (bomb-tick si))))
;KEY
(define (key si key)
  (cond [(string=? key "left")
         (make-si (si-ex si)
                  (si-ey si)
                  (limit (+ -10 (si-tx si)))
                  (si-bulx si)
                  (si-buly si)
                  (si-bomx si)
                  (si-bomy si)
                  (si-edir si))]
        [(string=? key "right")
         (make-si (si-ex si)
                  (si-ey si)
                  (limit (+ 10 (si-tx si)))
                  (si-bulx si)
                  (si-buly si)
                  (si-bomx si)
                  (si-bomy si)
                  (si-edir si))]
        [(and (string=? key "up")
              (not (bullet-on-screen? si)))
         (make-si (si-ex si)
                  (si-ey si)
                  (si-tx si)
                  (si-tx si)
                  500
                  (si-bomx si)
                  (si-bomy si)
                  (si-edir si))]
        [else si])) 
;BIG-BANG
(big-bang START
          (name "Space Invaders")
          (on-draw draw)
          (on-tick tick .05)
          (on-key key)
          (stop-when game-over? game-over))
