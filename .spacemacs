;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Variables

(setq-default
 ;; List of additional paths where to look for configuration layers.
 ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
 dotspacemacs-configuration-layer-path '("~/.spacemacs_contribs/")
 ;; List of contribution to load.
 dotspacemacs-configuration-layers '(kostajh)
 ;; If non nil the frame is maximized when Emacs starts up (Emacs 24.4+ only)
 dotspacemacs-fullscreen-at-startup nil
 ;; A list of packages and/or extensions that will not be install and loaded.
 dotspacemacs-excluded-packages '()
 ;; The default package repository used if no explicit repository has been
 ;; specified with an installed package.
 ;; Not used for now.
 dotspacemacs-default-package-repository nil
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

    ;; Deft
    (defvar deft-extension "md")
    (defvar deft-directory "/mnt/data/ownCloud/Notes")
    (defvar deft-text-mode 'markdown-mode)
    (defvar deft-use-filename-as-title t)

    ;; mu4e
    (eval-after-load 'mu4e
    '(progn
    (setq
     mu4e-maildir       "~/mail/mayfirst"   ;; top-level Maildir
        mu4e-sent-folder   "/INBOX.Sent"       ;; folder for sent messages
        mu4e-drafts-folder "/INBOX.Drafts"     ;; unfinished messages
        mu4e-trash-folder  "/INBOX.Trash"      ;; trashed messages
        mu4e-refile-folder "/INBOX.Archive"   ;; saved messages
        mu4e-get-mail-command "offlineimap -q"
        mu4e-update-interval 900
    )

    (setq message-send-mail-function 'smtpmail-send-it)
    (setq smtpmail-smtp-server "mail.mayfirst.org")
    (setq smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg"))
    (setq smtpmail-default-smtp-server "mail.mayfirst.org")
    (setq smtpmail-local-domain "kostaharlan.net")
    (setq user-full-name "Kosta Harlan")
    (setq user-mail-address "kosta@kostaharlan.net")
    (setq gnutls-algorithm-priority "NORMAL:%COMPAT")
    (setq smtpmail-stream-type 'ssl
          smtpmail-smtp-service 465)
    (setq mu4e-attachment-dir  "~/Downloads")
    (setq mu4e-maildir-shortcuts
        '( ("/INBOX"     . ?i)
           ("/INBOX.Archive"   . ?a)
           ("/INBOX.Sent"      . ?s)))

    ;; enable inline images
    (setq mu4e-view-show-images t)
    ;; use imagemagick, if available
    (when (fboundp 'imagemagick-register-types)
      (imagemagick-register-types))
    (setq mu4e-html2text-command "pandoc -f html -t plain")

    (setq message-kill-buffer-on-exit t)

    (add-to-list 'mu4e-bookmarks
                 '("to:kharlan@isovera.com"           "Isovera"          ?i) t)

    (add-to-list 'mu4e-bookmarks
                 '("to:kosta@designhammer.com"        "DesignHammer"     ?d) t)

    (setq
       mu4e-compose-signature
       (concat
          "kostaharlan.net | @kostajh"))

    (add-hook 'mu4e-index-updated-hook
        (lambda ()
          (shell-command (concat "/home/kosta/src/dotfiles/youve_got_mail.sh "
               (number-to-string mu4e-update-interval)))))))

    ;; Jabber.el
    ;; Jabber.el
    (defvar hipchat-number "115486")
    (defvar hipchat-nickname "Kosta Harlan")

    ;; Join a room
    (defun hipchat-join (room)
        (interactive "sRoom name: ")
        (jabber-groupchat-join
            (jabber-read-account)
            (concat hipchat-number "_" room "@conf.hipchat.com")
            hipchat-nickname
            t))

    ;; Mention nicknames in a way that HipChat clients will pickup
    (defun hipchat-mention (nickname)
        (interactive
            (list (jabber-muc-read-nickname jabber-group "Nickname: ")))
                (insert (concat "@\"" nickname "\" ")))


    ;; Twittering
    (setq twittering-use-master-password t)
    (add-hook 'twittering-edit-mode-hook 'flyspell-mode)
    (add-hook 'twittering-mode
              (lambda()
                (flyspell-mode t)
                (setq truncate-lines t)
                (setq word-wrap t)))

)

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
 '(ahs-inhibit-face-list nil)
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(global-linum-mode t)
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
 '(markdown-command "pandoc")
 '(php-manual-path "~/docs/php")
 '(php-mode-coding-style (quote psr2))
 '(vc-follow-symlinks nil)
 '(visible-bell t))
 '(ring-bell-function (quote ignore) t)
 '(send-mail-function (quote sendmail-send-it))
 (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 120 :family "M+ 1m Regular")))))
