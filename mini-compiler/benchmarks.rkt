#lang racket

(require "main.rkt")

(define benchmark-directory "../benchmarks")

;;
(define (benchmark pat lst?)
  (for ([test-name (directory-list benchmark-directory)]
        #:when (and (directory-exists? (build-path benchmark-directory test-name))
                    (regexp-match pat (path->string test-name))))
    (displayln test-name)
    (unless lst?
      (define benchmark-content
        (directory-list (build-path benchmark-directory test-name) #:build? #t))

      (define mini-file (findf (λ (file) (has-extension? file ".mini")) benchmark-content))
      (define llvm-file (path-replace-extension mini-file ".ll"))
      (define executable (path-replace-extension mini-file ""))
    
      (with-handlers ([exn:fail:filesystem? (const (void))])
        (delete-file llvm-file)
        (delete-file executable))

      (compile mini-file #t #f #f)
    
      (when (file-exists? executable)
        (for ([input  (filter (λ (file) (name-incules? file "input"))  benchmark-content)]
              [output (filter (λ (file) (name-incules? file "output")) benchmark-content)])
          (printf "\tinput: ~a~n\toutput:  ~a~n" input output)
          (system (format "~a < ~a | diff ~a -" executable input output)))))))

;;
(define (has-extension? path ext)
  (string-suffix? (path->string path) ext))

;;
(define (name-incules? path str)
  (let-values ([(_ name _b) (split-path path)])
    (string-contains? (path->string name) str)))


;; Command line argument parser
(module* main #f
  (define list? (make-parameter #f))
  (define regexp-pattern (make-parameter #rx".*"))

  (command-line
   #:program "benchmark"
   #:once-each
   [("-l" "--list") "List tests, but do not run" (list? #t)]
   [("-r" "--regexp") pat "Regexp pattern to use for test selection" (regexp-pattern (regexp pat))])

  (benchmark (regexp-pattern) (list?)))