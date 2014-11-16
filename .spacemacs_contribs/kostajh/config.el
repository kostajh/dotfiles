(add-to-list 'package-archives
               '("marmalade" . "https://marmalade-repo.org/packages/"))

;; Enable flycheck for the following modes
(dolist (mode '(php
                drupal 
                json 
                yaml))
  (add-hook (intern (concat (symbol-name mode) "-mode-hook"))
            'flycheck-mode))

;; Programming hooks
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'ggtags-mode)

;; PHP hooks
(add-hook 'php-mode-hook 'ggtags-mode)
(add-hook 'php-mode-hook 'turn-on-eldoc-mode)
(add-hook 'php-mode-hook 'setq-local eldoc-documentation-function #'ggtags-eldoc-function)

;; Deft
(defvar deft-extension "md")
(defvar deft-directory "/mnt/data/ownCloud/Notes")
(defvar deft-text-mode 'markdown-mode)
(defvar deft-use-filename-as-title t)

;; Sass
(setq-default scss-compile-at-save nil)

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
(add-hook 'jabber-chat-mode-hook 'flyspell-mode)
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

;; psysh.el
(defun psysh-set-breakpoint()
  (interactive)
  (move-beginning-of-line 1)
  (open-line 1)
  (next-line 1)
  (insert "require_once '/home/kosta/.composer/vendor/bin/psysh'; Psy\\Shell::debug(get_defined_vars());")
  (open-line 1)
  )
