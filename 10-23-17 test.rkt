;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |10-23-17 test|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
#|
Too big - over 700
(min num 700)
(a-o-i img) > num
if num is over 700> set back to 700, if under increase by 50. if resulting num is over 700 set back to 700
|#
(define (a-o-i img) ( - (min (+ (image-width img) 50) 700) (image-width img) ))
;CHECKS:
(check-expect (a-o-i (rectangle 500 500 "solid" "red")) 50)
(check-expect (a-o-i (rectangle 670 670 "solid" "red")) 30)
(check-expect (a-o-i (rectangle 700 700 "solid" "red")) 0)

(define background (beside (rectangle 5 200 "solid" "black")
(rectangle 40 200 "solid" "yellow") 
                           (rectangle 5 200 "solid" "black")
(rectangle 40 200 "solid" "yellow")
                           (rectangle 5 200 "solid" "black")
(rectangle 40 200 "solid" "yellow")
                           (rectangle 5 200 "solid" "black")
(rectangle 40 200 "solid" "yellow")
                           (rectangle 5 200 "solid" "black")
(rectangle 40 200 "solid" "yellow")
                           (rectangle 5 200 "solid" "black")
(rectangle 40 200 "solid" "yellow")
                           (rectangle 5 200 "solid" "black")))
(define (move25 img x y event) (beside (rectangle 25 0 "solid" "white") img))
(define (move50 img key) (crop-left img 50))
(define (draw img) (overlay/align "left" "top" (scale .2 (overlay/align "left" "middle" img (scale 4 (beside background (rectangle 500 200 "solid" "red"))))) (overlay/align "left" "middle" img (scale 4 background))))
(define model (circle 50 "solid" "blue"))
(big-bang model
          (on-mouse move25)
          (on-key move50)
          (on-draw draw)
          )