(defvar kostajh-packages
  '(
    ag
    deft
    drupal-mode
    edit-server
    ggtags
    helm-ag
    jabber
    php-extras
    php-auto-yasnippets
    php-mode
    restclient
    syslog-mode
    twittering-mode
    yaml-mode
    ))

;; Mu4e needs to be loaded manually.
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'mu4e)
(global-set-key [f11] 'mu4e)
(require 'org-mu4e)

;; Load psysh-debug-mode manually.
(add-to-list 'load-path "/home/kosta/src/psysh-debug-mode.el")
(require 'psysh-debug-mode)

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
