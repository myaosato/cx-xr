(defpackage cx-xr
  (:use :cl)
  (:export ))
(in-package :cx-xr)

(defun addad (&optional (lst '(nil)))
  (append (mapcar (lambda (elt) (cons #\A elt)) lst)
          (mapcar (lambda (elt) (cons #\D elt)) lst)))

(defun addad-n (n)
  (do ((lst (addad) (addad lst))
       (cnt 1 (1+ cnt)))
      ((= cnt n) lst)))

(defun make-cx-xr (chars)
  (let ((lst 'lst))
    (dolist (ad (reverse chars) lst)
      (cond ((equal ad #\A) (setf lst (list 'car lst)))
            ((equal ad #\D) (setf lst (list 'cdr lst)))
             (t nil)))))

(defun chars-to-symbol (chars)
  (intern (concatenate 'string '(#\C) chars '(#\R))))

(defun cx-xr-lst (n)
  (let ((lst (addad-n n)))
    (mapcar (lambda (chars)
              `(defun ,(chars-to-symbol chars) (lst) ,(make-cx-xr chars)))
            lst)))

(defun s-exp-def-cx-xr (n)
  (if (>= n 5)
      (cons 'progn (loop for i from 5 to n
                      append (cx-xr-lst i)))))

(defun def-cx-xr (n)
  (if (eval (s-exp-def-cx-xr n))
      t
      nil))

