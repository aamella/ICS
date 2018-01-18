;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname click-speed) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require picturing-programs)
(define (mouse-h m x y event)
  (cond [(string=? event "button-down")
         (add1 m)]
        [else m]))
(define (draw-h x)
  (overlay/align "left" "top" (text (string-append "Clicks: "
                                                   (number->string (fix x)))
                                    20 "black")
                 (empty-scene 500 500)))
(define TIME (current-milliseconds))
(define (current-time null)
  (/ (- (current-milliseconds)
        TIME)
     1000))
(define (fix x)
  (round (exact->inexact (/ x (current-time 1)))))
(big-bang 1
          (on-mouse mouse-h)
          (on-draw draw-h))