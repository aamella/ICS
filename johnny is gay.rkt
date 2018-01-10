;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |johnny is gay|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define mirror (rectangle 50 100 "solid" "black"))
(define starter pic:bloch)
(define a (rectangle 300 200 "solid" "brown"))
(define mirror-hole-1 (above (rectangle 50 100 "solid" "brown") (rectangle 50 100 "solid" (make-color 0 0 0 0))))
(define mirror-hole-2 (above (rectangle 80 100 "solid" "brown") (rectangle 80 100 "solid" (make-color 0 0 0 0))))
(define mirror-hole-3 (above (rectangle 50 50 "solid" "brown") (rectangle 50 150 "solid" (make-color 0 0 0 0))))
(define mirror-holes (beside a mirror-hole-1 a mirror-hole-2 a mirror-hole-3 a))
(define el-piso (rectangle (image-width mirror-holes) 25 "solid" "black"))
(define foreground (above mirror-holes el-piso))
(define background (rectangle (image-width foreground) (- (image-height foreground) (image-height el-piso)) "solid" "lightblue"))

(define (reset-x model x y mouse-event)
 starter)
(define (move-x x key)
  (if (and (> (image-width x) (image-width starter)) (< (image-width x) (image-width background))) (cond
                                                              [(key=? key "right") (beside (rectangle 10 0 "solid" (make-color 0 0 0 0)) x)]
                                                              [(key=? key "left") (crop-left x 10)]
                                                              [else x])
      (cond
        [(key=? key "right") (beside (rectangle 10 0 "solid" (make-color 0 0 0 0)) x)]
        [else x])))
(< (image-width starter) 150)
(> (image-width starter) 100)

(define (draw-x x)
  (cond
    [(and (>= (image-width x) (image-width starter)) (<= (image-width x) 300)) (overlay/align "left" "top" (overlay/align "left" "bottom" x foreground)
                                                                                               (overlay/align "left" "bottom"
                                                                                                              (beside (rectangle (+ (image-width x) 30) 0 "solid" "yellow") starter)
                                                                                                              background))]
    [(and (> (image-width x) 300) (<= (image-width x) 700)) (overlay/align "left" "top" (overlay/align "left" "bottom" x foreground)
                                                                                               (overlay/align "left" "bottom"
                                                                                                              (beside (rectangle (+ (image-width x) 30) 0 "solid" "yellow") (scale/xy 1.5 1 starter))
                                                                                                              background))]
    [(> (image-width x) 700) (overlay/align "left" "top" (overlay/align "left" "bottom" x foreground)
                                                                                               (overlay/align "left" "bottom"
                                                                                                              (beside (rectangle (+ (image-width x) 30) 0 "solid" "yellow") (scale/xy 1 2 starter))
                                                                                                              background))]))
(big-bang starter
          (on-key move-x)
          (on-draw draw-x)
          (on-mouse reset-x))