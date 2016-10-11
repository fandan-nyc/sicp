(define (adjoin-set x set)
  (if (null? set)
      (list x)
      (if  ( < (weight x) ( weight (car set)))
           (cons x set)
           (cons (car set) (adjoin-set x (cdr set))))))


(define (make-leaf-set pairs)
  (if (null? pairs)
      null
      (let ((ele (car pairs)))
        (adjoin-set (make-leaf (car ele) (cadr ele))
                    (make-leaf-set (cdr pairs))))))

;(make-leaf-set (list (list 'a 4) (list 'b 3) (list 'c 1) (list 'd 9)))


(define (build-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
    (if(null? (cdr leaf-set))
       (car leaf-set)
       (successive-merge (adjoin-set (make-code-tree (car leaf-set) (cadr leaf-set))
                                    (cddr leaf-set)))
       ))
