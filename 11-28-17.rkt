;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11-28-17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require picturing-programs)
(define (chop-string x)
  (substring x 1 (string-length x)))
(define (show-string x)
  (text x 18 "blue"))
(define (stop x)
  (string=? x ""))
(big-bang "antidisestablishmentarianism"
          (on-draw show-string)
          (name "test")
          (on-tick chop-string .25)
          (stop-when stop))
(define (add-b x) (string-append x "b"))
(define (stop-at-10 x) (= (string-length x) 10))
(define (show-long-string x)
  (overlay (show-string x) (rectangle 800 0
                                      "solid" "white")))
(big-bang "a"
          (on-draw show-long-string)
          (name "test")
          (on-tick add-b .5)
          (stop-when stop-at-10))