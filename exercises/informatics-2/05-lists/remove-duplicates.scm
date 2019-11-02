(require rackunit rackunit/text-ui)

(define (remove-duplicates l)
  (define (deduplicate remaining seen unique)
    (cond ((null? remaining) unique)
          ((member (car remaining) seen) (deduplicate (cdr remaining)
                                          seen
                                          unique))
          (else (deduplicate (cdr remaining)
                             (cons (car remaining) seen)
                             (cons (car remaining) unique)))))
  (reverse (deduplicate l '() '())))

(define remove-duplicates-tests
  (test-suite
    "Tests for remove-duplicates"

    (check-equal? (remove-duplicates '(42)) '(42))
    (check-equal? (remove-duplicates '(6 6 6)) '(6))
    (check-equal? (remove-duplicates '(1 2 3 4 5 6)) '(1 2 3 4 5 6))
    (check-equal? (remove-duplicates '(4 3 3 2 5 2)) '(4 3 2 5))
    (check-equal? (remove-duplicates '(10 10 8 2 2 2 9 9)) '(10 8 2 9))))

(run-tests remove-duplicates-tests)
