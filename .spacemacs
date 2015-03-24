;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Configuration Layers
;; --------------------

(defun dotspacemacs/layers ()
 (setq-default
 ;; List of additional paths where to look for configuration layers.
 ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
 dotspacemacs-configuration-layer-path '()
 ;; List of configuration layers to load. If it is the symbol `all' instead
 ;; of a list then all discovered layers will be installed.
 dotspacemacs-configuration-layers '(kostajh
                                     perspectives
                                     markdown
                                     floobits
                                     (rcirc :variables
                                            rcirc-enable-authinfo-support t)
                                     dockerfile
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
                                    (colors :variables colors-enable-rainbow-identifiers t)
                                     )
 ;; A list of packages and/or extensions that will not be install and loaded.
 dotspacemacs-excluded-packages '(auto-complete ac-ispell flycheck-ledger tern-auto-complete auto-complete-clang enslime edts)
 ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
 ;; are declared in a layer which is not a member of
 ;; the list `dotspacemacs-configuration-layers'
 dotspacemacs-delete-orphan-packages t))

;; Settings
;; --------

(defun dotspacemacs/init ()
 (setq-default
 ;; Specify the startup banner. If the value is an integer then the
 ;; banner with the corresponding index is used, if the value is `random'
 ;; then the banner is chosen randomly among the available banners, if
 ;; the value is nil then no banner is displayed.
 dotspacemacs-startup-banner 'official
 ;; List of themes, the first of the list is loaded when spacemacs starts.
 ;; Press <SPC> T n to cycle to the next theme in the list (works great
 ;; with 2 themes variants, one dark and one light)
 dotspacemacs-themes '(solarized-dark
                       solarized-light
                       leuven
                       monokai
                       zenburn
                       )
 ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
 ;; size to make separators look not too crappy.
 dotspacemacs-default-font '("M+ 1m"
                             :size 13
                             :weight normal
                             :width normal
                             :slant normal
                             :powerline-scale 1.1)
 dotspacemacs-colorize-cursor-according-to-state t
 ;; The leader key
 dotspacemacs-leader-key "SPC"
 ;; Major mode leader key is a shortcut key which is the equivalent of
 ;; pressing `<leader> m`
 dotspacemacs-major-mode-leader-key ","
 ;; The command key used for Evil commands (ex-commands) and
 ;; Emacs commands (M-x).
 ;; By default the command key is `:' so ex-commands are executed like in Vim
 ;; with `:' and Emacs commands are executed with `<leader> :'.
 dotspacemacs-command-key ":"
 ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
 ;; the commands bound to the current keystrokes.
 dotspacemacs-guide-key-delay 0.4
 ;; If non nil a progress bar is displayed when spacemacs is loading. This
 ;; may increase the boot time on some systems and emacs builds, set it to nil
 ;; to boost the loading time.
 dotspacemacs-loading-progress-bar t
 ;; Enable micro-state for helm buffer when pressing on TAB."
 dotspacemacs-helm-micro-state t
 ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
 ;; several times cycle between the kill ring content.
 dotspacemacs-enable-paste-micro-state t
 ;; If non nil the frame is fullscreen when Emacs starts up (Emacs 24.4+ only).
 dotspacemacs-fullscreen-at-startup t
 ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
 ;; Use to disable fullscreen animations in OSX."
 dotspacemacs-fullscreen-use-non-native nil
 ;; If non nil the frame is maximized when Emacs starts up (Emacs 24.4+ only).
 ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
 dotspacemacs-maximized-at-startup t
 ;; A value from the range (0..100), in increasing opacity, which describes the
 ;; transparency level of a frame when it's active or selected. Transparency can
 ;; be toggled through `toggle-transparency'.
 dotspacemacs-active-transparency 90
 ;; A value from the range (0..100), in increasing opacity, which describes the
 ;; transparency level of a frame when it's inactive or deselected. Transparency
 ;; can be toggled through `toggle-transparency'.
 dotspacemacs-inactive-transparency 90
 ;; If non nil unicode symbols are displayed in the mode line (e.g. for lighters)
 dotspacemacs-mode-line-unicode-symbols t
 ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth scrolling
 ;; overrides the default behavior of Emacs which recenters the point when
 ;; it reaches the top or bottom of the screen
 dotspacemacs-smooth-scrolling t
 ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
 dotspacemacs-smartparens-strict-mode nil
 ;; If non nil advises quit functions to keep server open when quitting.
 dotspacemacs-persistent-server nil
 ;; The default package repository used if no explicit repository has been
 ;; specified with an installed package.
 ;; Not used for now.
 dotspacemacs-default-package-repository nil))

(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."
  (setq rcirc-server-alist
  '(("irc.freenode.net"
      :user "kostajh"
      :port "1337"
      :channels ("#drush"))))
)

;; Custom variables
;; ----------------

;; Do not write anything in this section. This is where Emacs will
;; auto-generate custom variable definitions.

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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
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
 '(confirm-kill-emacs (quote yes-or-no-p))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("cbef37d6304f12fb789f5d80c2b75ea01465e41073c30341dc84c6c0d1eb611d" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "4e262566c3d57706c70e403d440146a5440de056dfaeb3062f004da1711d83fc" "b69df114abdbbf223e1ad2c98ad1abee04ac2a5070aeb8b7ceefcf00aa5e43f8" default)))
 '(emacs-lock-default-locking-mode nil)
 '(gnutls-min-prime-bits 1024)
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(if (version< emacs-version "24.4"))
 '(jabber-account-list
   (quote
    (("kostajh@gmail.com")
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
 '(mu4e-compose-dont-reply-to-self t)
 '(mu4e-compose-signature-auto-include nil)
 '(org-clock-clocked-in-display (quote both))
 '(org-clock-out-remove-zero-time-clocks t)
 '(org-clock-sound t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-crypt org-docview org-gnus org-habit org-id org-info org-inlinetask org-irc org-mhe org-rmail org-w3m)))
 '(org-show-notification-handler "notify-send")
 '(paradox-github-token t)
 '(phpunit-program "/home/kosta/src/mitpress/bin/phpunit")
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(rcirc-authenticate-before-join t)
 '(rcirc-default-nick "kostajh")
 '(ring-bell-function (quote ignore) t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(vc-follow-symlinks t)
 '(visible-bell t))
 '(ring-bell-function (quote ignore) t)
 '(send-mail-function (quote sendmail-send-it)
 )

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
 '(outline-3 ((t (:inherit org-level-3 :height 1.0))))
 '(outline-4 ((t (:inherit org-level-4 :height 1.0)))))
