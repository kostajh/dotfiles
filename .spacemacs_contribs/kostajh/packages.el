(defvar kostajh-packages
  '(
    deft
    jabber
    twittering-mode
    helm-ag
    php-mode
    php-extras
    drupal-mode
    edit-server
    syslog-mode
    yaml-mode
    ag
    ))

;; Mu4e needs to be loaded manually.
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'mu4e)
(global-set-key [f11] 'mu4e)

(defun kostajh/init-helm-ag ()
  (use-package helm-ag
    :init
    (progn
      (defun kostajh-helm-ag ()
        (interactive)
        (helm-ag (projectile-project-root)))
      (evil-leader/set-key
        "oa" 'kostajh-helm-ag))))

(defun kostajh/init-yaml-mode ()
  (use-package yaml-mode
    :defer t))
