;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 12-14-17-2balls) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)

(define-struct balls (x1 y1 x2 y2))
(define start (make-balls 0 300 300 0))
(define (draw a)
  (place-image (circle 10 "solid" "blue")
               (balls-x1 a) (balls-y1 a)
               (place-image (circle 10 "solid" "red")
                            (balls-x2 a) (balls-y2 a)
                            (empty-scene 300 300))))
(define (key a key)
  (cond         [(and (key=? key "w") (key=? key "up"))
                 (make-balls(+ (balls-x1 a) 0)
                            (+ (balls-y1 a) -2)
                            (+ (balls-x2 a) 0)
                            (+ (balls-y2 a) -2))]
                [(and (key=? key "w") (key=? key "down"))
                 (make-balls(+ (balls-x1 a) 0)
                            (+ (balls-y1 a) -2)
                            (+ (balls-x2 a) 0)
                            (+ (balls-y2 a) 2))]
                [(and (key=? key "w") (key=? key "left"))
                 (make-balls(+ (balls-x1 a) 0)
                            (+ (balls-y1 a) -2)
                            (+ (balls-x2 a) -2)
                            (+ (balls-y2 a) 0))]
                [(and (key=? key "w") (key=? key "right"))
                 (make-balls(+ (balls-x1 a) 0)
                            (+ (balls-y1 a) -2)
                            (+ (balls-x2 a) 2)
                            (+ (balls-y2 a) 0))]
                [(and (key=? key "a") (key=? key "up"))
                 (make-balls(+ (balls-x1 a) -2)
                            (+ (balls-y1 a) 0)
                            (+ (balls-x2 a) 0)
                            (+ (balls-y2 a) -2))]
                [(and (key=? key "a") (key=? key "down"))
                 (make-balls(+ (balls-x1 a) -2)
                            (+ (balls-y1 a) 0)
                            (+ (balls-x2 a) 0)
                            (+ (balls-y2 a) 2))]
                [(and (key=? key "a") (key=? key "left"))
                 (make-balls(+ (balls-x1 a) -2)
                            (+ (balls-y1 a) 0)
                            (+ (balls-x2 a) -2)
                            (+ (balls-y2 a) 0))]
                [(and (key=? key "a") (key=? key "right"))
                 (make-balls(+ (balls-x1 a) -2)
                            (+ (balls-y1 a) 0)
                            (+ (balls-x2 a) 2)
                            (+ (balls-y2 a) 0))]
                [(and (key=? key "s") (key=? key "up"))
                 (make-balls(+ (balls-x1 a) 0)
                            (+ (balls-y1 a) 2)
                            (+ (balls-x2 a) 0)
                            (+ (balls-y2 a) -2))]
                [(and (key=? key "s") (key=? key "down"))
                 (make-balls(+ (balls-x1 a) 0)
                            (+ (balls-y1 a) 2)
                            (+ (balls-x2 a) 0)
                            (+ (balls-y2 a) 2))]
                [(and (key=? key "s") (key=? key "left"))
                 (make-balls(+ (balls-x1 a) 0)
                            (+ (balls-y1 a) 2)
                            (+ (balls-x2 a) 2)
                            (+ (balls-y2 a) 0))]
                [(and (key=? key "s") (key=? key "right"))
                 (make-balls(+ (balls-x1 a) 0)
                            (+ (balls-y1 a) 2)
                            (+ (balls-x2 a) 2)
                            (+ (balls-y2 a) 0))]
                [(and (key=? key "d") (key=? key "up"))
                 (make-balls(+ (balls-x1 a) 2)
                            (+ (balls-y1 a) 0)
                            (+ (balls-x2 a) 0)
                            (+ (balls-y2 a) -2))]
                [(and (key=? key "d") (key=? key "down"))
                 (make-balls(+ (balls-x1 a) 2)
                            (+ (balls-y1 a) 0)
                            (+ (balls-x2 a) 0)
                            (+ (balls-y2 a) 2))]
                [(and (key=? key "d") (key=? key "left"))
                 (make-balls(+ (balls-x1 a) 2)
                            (+ (balls-y1 a) 0)
                            (+ (balls-x2 a) 2)
                            (+ (balls-y2 a) 0))]
                [(and (key=? key "d") (key=? "right"))
                 (make-balls(+ (balls-x1 a) 2)
                            (+ (balls-y1 a) 0)
                            (+ (balls-x2 a) 2)
                            (+ (balls-y2 a) 0))]
                [(key=? "w" key) (make-balls (balls-x1 a)
                                             (- (balls-y1 a) 2)
                                             (balls-x2 a)
                                             (balls-y2 a))]
                [(key=? "s" key) (make-balls(balls-x1 a)
                                            (+ (balls-y1 a) 2)
                                            (balls-x2 a)
                                            (balls-y2 a))]
                [(key=? "up" key) (make-balls(balls-x1 a)
                                             (balls-y1 a)
                                             (balls-x2 a)
                                             (- (balls-y2 a) 2))]
                [(key=? "down" key) (make-balls(balls-x1 a)
                                               (balls-y1 a)
                                               (balls-x2 a)
                                               (+ (balls-y2 a) 2))]
                [(key=? "right" key) (make-balls(balls-x1 a)
                                                (balls-y1 a)
                                                (+ (balls-x2 a) 2)
                                                (balls-y2 a))]
                [(key=? "left" key) (make-balls(balls-x1 a)
                                               (balls-y1 a)
                                               (- (balls-x2 a) 2)
                                               (balls-y2 a))]
                [(key=? "a" key) (make-balls(- (balls-x1 a) 2)
                                            (balls-y1 a)
                                            (balls-x2 a)
                                            (balls-y2 a))]
                [(key=? "d" key) (make-balls(+ (balls-x1 a) 2)
                                            (balls-y1 a)
                                            (balls-x2 a)
                                            (balls-y2 a))]

                [else a]))

(big-bang start (on-draw draw)
          (on-key key))