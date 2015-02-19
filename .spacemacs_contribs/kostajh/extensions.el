;;; extensions.el --- kostajh Layer extensions File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar kostajh-pre-extensions
  '(
    ;; pre extension kostajhs go here
    )
  "List of all extensions to load before the packages.")

(defvar kostajh-post-extensions
  '(
    ;; post extension kostajhs go here
    mu4e
    )
  "List of all extensions to load after the packages.")

;; For each extension, define a function kostajh/init-<extension-kostajh>
;;
(defun kostajh/init-mu4e ()
  "Initialize my extension"
    (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
    (require 'mu4e)
    (global-set-key [f11] 'mu4e)
    (require 'org-mu4e)
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
