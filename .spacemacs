;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Variables

(setq-default
 ;; List of additional paths where to look for configuration layers.
 ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
 dotspacemacs-configuration-layer-path '()
 ;; List of contribution to load.
 dotspacemacs-configuration-layers '(kostajh php python company-mode javascript restclient github org-repo-todo)
 ;; If non nil the frame is maximized when Emacs starts up (Emacs 24.4+ only)
 dotspacemacs-fullscreen-at-startup nil
 ;; A list of packages and/or extensions that will not be install and loaded.
 dotspacemacs-excluded-packages '(auto-complete ac-ispell flycheck-ledger tern-auto-complete auto-complete-clang enslime edts)
 ;; The default package repository used if no explicit repository has been
 ;; specified with an installed package.
 ;; Not used for now.
 dotspacemacs-default-package-repository nil
 dotspacemacs-default-theme 'solarized-dark
)

;; Functions

(defun dotspacemacs/init ()
  "User initialization for Spacemacs. This function is called at the very
 startup."
  (require 'server)
    (unless (server-running-p)
    (server-start))
)

(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."
)

;; Custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(company-backends (quote ((company-tern :with company-yasnippet) (php-extras-company :with company-yasnippet :with company-gtags :with company-capf :with company-dabbrev-code :with company-keywords :with company-files) (company-elisp :with company-yasnippet) (company-bbdb :with company-yasnippet) (company-nxml :with company-yasnippet) (company-css :with company-yasnippet) (company-eclim :with company-yasnippet) (company-semantic :with company-yasnippet) (company-clang :with company-yasnippet) (company-xcode :with company-yasnippet) (company-ropemacs :with company-yasnippet) (company-cmake :with company-yasnippet) (company-capf :with company-yasnippet) (company-dabbrev-code company-gtags company-etags company-keywords :with company-yasnippet) (company-oddmuse :with company-yasnippet) (company-files :with company-yasnippet) (company-dabbrev :with company-yasnippet))))
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(elfeed-feeds (quote ("https://www.drupal.org/planet/rss.xml")))
 '(gnutls-min-prime-bits 1024)
 '(haskell-notify-p t)
 '(haskell-process-type (quote cabal-dev))
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(jabber-account-list (quote (("kostajh@gmail.com" (:network-server . "talk.google.com")) ("115486_1191911@chat.hipchat.com" (:network-server . "chat.hipchat.com") (:port . 5222)))))
 '(jabber-alert-message-hooks (quote (jabber-message-notifications jabber-message-echo jabber-message-scroll)))
 '(jabber-alert-presence-hooks nil)
 '(jabber-history-enabled t)
 '(jabber-history-muc-enabled t)
 '(linum-delay t)
 '(linum-eager nil)
 '(magit-use-overlays nil)
 '(markdown-command "pandoc")
 '(org-clock-clocked-in-display (quote both))
 '(paradox-github-token t)
 '(php-manual-path "~/docs/php")
 '(php-mode-coding-style (quote psr2))
 '(psysh-debug-bin-path "/home/kosta/.composer/vendor/bin/psysh")
 '(rcirc-authenticate-before-join t)
 '(rcirc-default-nick "kostajh")
 '(ring-bell-function (quote ignore) t)
 '(vc-follow-symlinks nil)
 '(visible-bell t))
 '(ring-bell-function (quote ignore) t)
 '(send-mail-function (quote sendmail-send-it))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 110 :family "M+ 1m Regular"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
 '(outline-1 ((t (:inherit org-level-1 :height 1.0))))
 '(outline-2 ((t (:inherit org-level-2 :height 1.0))))
 '(outline-3 ((t (:inherit org-level-3 :height 1.0)))))
