;;; core-dotspacemacs.el --- Spacemacs Core File
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
(defconst dotspacemacs-template-directory
  (expand-file-name (concat spacemacs-core-directory "templates/"))
  "Templates directory.")

(defvar dotspacemacs-configuration-layer-path '()
  "List of additional paths where to look for configuration layers.
Paths must have a trailing slash (ie. `~/.mycontribs/')")

(defvar dotspacemacs-startup-banner 'random
  "Specify the startup banner. If the value is an integer then the
banner with the corresponding index is used, if the value is `random'
then the banner is chosen randomly among the available banners, if
the value is nil then no banner is displayed.")

(defvar dotspacemacs-configuration-layers '(kostajh
                                            perspectives
                                            php
                                            python
                                            html
                                            company-mode
                                            javascript
                                            restclient
                                            (git :variables
                                                git-magit-status-fullscreen t
                                                git-enable-github-support t
                                                git-gutter-use-fringe t)
                                            colors))
  "List of configuration layers to load. If it is the symbol `all' instead
of a list then all discovered layers will be installed."

(defvar dotspacemacs-themes '(solarized-light
                              solarized-dark
                              )
  "List of themes, the first of the list is loaded when spacemacs starts.
Press <SPC> T n to cycle to the next theme in the list (works great
with 2 themes variants, one dark and one light")

(defvar dotspacemacs-leader-key "SPC"
  "The leader key.")

(defvar dotspacemacs-major-mode-leader-key ","
  "Major mode leader key is a shortcut key which is the equivalent of
pressing `<leader> m`")

(defvar dotspacemacs-default-font '("M+ 1m Regular"
                                    :size 13
                                    :weight normal
                                    :width normal
                                    :powerline-scale 1.1)
  "Default font. `powerline-scale' allows to quickly tweak the mode-line
size to make separators look not too crappy.")

(defvar dotspacemacs-command-key ":"
  "The key used for Evil commands (ex-commands) and Emacs commands (M-x).
By default the command key is `:' so ex-commands are executed like in Vim
with `:' and Emacs commands are executed with `<leader> :'.")

(defvar dotspacemacs-guide-key-delay 0.4
  "Guide-key delay in seconds.")

(defvar dotspacemacs-loading-progress-bar t
  "If non nil a progress bar is displayed when spacemacs is loading. This
may increase the boot time on some systems and emacs builds, set it to nil
to boost the loading time.")

(defvar dotspacemacs-helm-micro-state t
  "Enable micro-state for helm buffer when pressing on TAB.")

(defvar dotspacemacs-fullscreen-at-startup t
  "If non nil the frame is fullscreen when Emacs starts up (Emacs 24.4+ only).")

(defvar dotspacemacs-fullscreen-use-non-native nil
  "If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen. Use
to disable fullscreen animations in OSX.")

(defvar dotspacemacs-maximized-at-startup nil
  "If non nil the frame is maximized when Emacs starts up (Emacs 24.4+ only).
Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.")

(defvar dotspacemacs-active-transparency 90
  "A value from the range (0..100), in increasing opacity, which describes the
transparency level of a frame when it's active or selected. Transparency
can be toggled through `toggle-transparency'.")

(defvar dotspacemacs-inactive-transparency 90
  "A value from the range (0..100), in increasing opacity, which describes the
transparency level of a frame when it's inactive or deselected. Transparency
can be toggled through `toggle-transparency'.")

(defvar dotspacemacs-mode-line-unicode-symbols t
  "If non nil unicode symbols are displayed in the mode-line (eg. for lighters)")

(defvar dotspacemacs-smooth-scrolling t
  "If non nil smooth scrolling (native-scrolling) is enabled. Smooth scrolling
overrides the default behavior of Emacs which recenters the point when
it reaches the top or bottom of the screen.")

(defvar dotspacemacs-persistent-server t
  "If non nil advises quit functions to keep server open when quitting.")

(defvar dotspacemacs-smartparens-strict-mode nil
  "If non-nil smartparens-strict-mode will be enabled in programming modes.")

(defvar dotspacemacs-delete-orphan-packages t
  "If non-nil spacemacs will delete any orphan packages, i.e. packages that are
declared in a layer which is not a member of
 `dotspacemacs-configuration-layers'")

(defvar dotspacemacs-default-package-repository 'melpa-stable
  "The default package repository used if no explicit repository has been
specified with an installed package.
NOT USED FOR NOW :-)")

(defvar dotspacemacs-excluded-packages '(auto-complete
                                         ac-ispell
                                         flycheck-ledger
                                         tern-auto-complete
                                         auto-complete-clang
                                         enslime
                                         edts)
  "A list of packages and/or extensions that will not be install and loaded.")

(defun dotspacemacs/location ()
  "Return the absolute path to the spacemacs dotfile."
  (concat user-home-directory ".spacemacs"))

(defun dotspacemacs/install ()
  "Install `.spacemacs.template' in home directory. Ask for confirmation
before installing the file if the destination already exists."
  (interactive)
  (let* ((dotfile "~/.spacemacs")
         (install (if (file-exists-p dotfile)
                      (y-or-n-p (format "%s already exists. Do you want to overwite it ? "
                                        dotfile))
                    t)))
    (when install
      (copy-file (concat dotspacemacs-template-directory
                         ".spacemacs.template") dotfile t)
      (message "%s has been installed." dotfile))))

(defun dotspacemacs/load ()
  "Load ~/.spacemacs if it exists."
  (let ((dotspacemacs (dotspacemacs/location)))
    (if (file-exists-p dotspacemacs) (load dotspacemacs))))

(defmacro dotspacemacs|call-func (func &optional msg)
  "Call the function from the dotfile only if it is bound.
If MSG is not nil then display a message in `*Messages'."
  `(progn
     (when ,msg (spacemacs/message ,msg))
     (if (fboundp ',func) (,func))))

(provide 'core-dotspacemacs)

;; Custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ispell-requires 4)
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(company-backends
   (quote
    ((company-tern :with company-yasnippet)
     (php-extras-company :with company-yasnippet :with company-gtags :with company-capf :with company-dabbrev-code :with company-keywords :with company-files)
     (company-elisp :with company-yasnippet)
     (company-bbdb :with company-yasnippet)
     (company-nxml :with company-yasnippet)
     (company-css :with company-yasnippet)
     (company-eclim :with company-yasnippet)
     (company-semantic :with company-yasnippet)
     (company-clang :with company-yasnippet)
     (company-xcode :with company-yasnippet)
     (company-ropemacs :with company-yasnippet)
     (company-cmake :with company-yasnippet)
     (company-capf :with company-yasnippet)
     (company-dabbrev-code company-gtags company-etags company-keywords :with company-yasnippet)
     (company-oddmuse :with company-yasnippet)
     (company-files :with company-yasnippet)
     (company-dabbrev :with company-yasnippet))))
 '(custom-safe-themes
   (quote
    ("9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(elfeed-feeds (quote ("https://www.drupal.org/planet/rss.xml")))
 '(gnutls-min-prime-bits 1024)
 '(haskell-notify-p t)
 '(haskell-process-type (quote cabal-dev))
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(jabber-account-list
   (quote
    (("kostajh@gmail.com"
      (:network-server . "talk.google.com"))
     ("115486_1191911@chat.hipchat.com"
      (:network-server . "chat.hipchat.com")
      (:port . 5222)))))
 '(jabber-alert-message-hooks
   (quote
    (jabber-message-notifications jabber-message-echo jabber-message-scroll)))
 '(jabber-alert-presence-hooks nil)
 '(jabber-history-enabled t)
 '(jabber-history-muc-enabled t)
 '(linum-delay t)
 '(linum-eager nil)
 '(magit-diff-use-overlays nil)
 '(magit-use-overlays nil)
 '(markdown-command "pandoc")
 '(org-babel-load-languages (quote ((emacs-lisp . t) (sh . t) (python . t))))
 '(org-clock-clocked-in-display (quote frame-title))
 '(org-clock-out-remove-zero-time-clocks t)
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
