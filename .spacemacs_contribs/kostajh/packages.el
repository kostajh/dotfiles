;;; packages.el --- kostajh Layer packages File for Spacemacs
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

(defvar kostajh-packages
  '(
    ;; package kostajhs go here
    ag
    apache-mode
    deft
    edit-server
    elfeed
    elfeed-org
    fabric
    feature-mode
    helm-ag
    helm-gtags
    helm-spotify
    jabber
    material-theme
    org-jira
    password-store
    notify
    sx
    syslog-mode
    twittering-mode
    yaml-mode
    org-cliplink
    org-present
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar kostajh-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function kostajh/init-<package-kostajh>
;;
(defun kostajh/init-twittering-mode()
  (use-package twittering-mode
    :defer t))

(defun kostajh/init-deft()
  (use-package deft
    :defer t))

(defun kostajh/init-password-store()
  (use-package password-store
    :defer t))

;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

;; (defun kostajh/init-helm-ag ()
;;   (use-package helm-ag
;;     :init
;;     (progn
;;       (defun kostajh-helm-ag ()
;;         (interactive)
;;         (helm-ag (projectile-project-root)))
;;       (evil-leader/set-key
;;         "oa" 'kostajh-helm-ag))))

;; (defun kostajh/init-yaml-mode ()
;;   (use-package yaml-mode
;;     :defer t))
