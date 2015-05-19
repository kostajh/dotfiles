(require 'ob-tangle)
(add-to-list 'package-archives
               '("marmalade" . "https://marmalade-repo.org/packages/"))

;;(elfeed-org)

;; Perspectives
(defun custom-persp/mu4e ()
  (interactive)
  (custom-persp "mu4e" (progn
                         (mu4e)
                         )))

(evil-leader/set-key "Lom" 'custom-persp/mu4e)

(defun custom-persp/ledger ()
  (interactive)
  (custom-persp "ledger" (progn
                           (find-file "/mnt/data/ownCloud/documents/ledger/ledger.txt")
                           (flycheck-mode)
                           )))
(evil-leader/set-key "Lol" 'custom-persp/ledger)


(defun custom-persp/twit ()
  (interactive)
  (custom-persp "twit" (progn
                         (twit)
                         (twittering-icon-mode)
                         (twittering-search "durham")
                         (split-window-right)
                         (twittering-icon-mode)
                         ))
  )
(evil-leader/set-key "Lot" 'custom-persp/twit)

(defun custom-persp/code ()
  (interactive)
  (custom-persp "code" (progn
                         (multi-term)
                         (evil-emacs-state)
                         (split-window-below -8)
                         (dired "~/src")
                         ))
  )
(evil-leader/set-key "Loc" 'custom-persp/code)

(defun custom-persp/sx ()
  (interactive)
  (custom-persp "sx" (progn
                       (sx-search)
                       )))
(evil-leader/set-key "Lox" 'custom-persp/sx)

(defun custom-persp/shell ()
  (interactive)
  (custom-persp "shell"
                (progn
                (multi-term)
                (evil-emacs-state)
                (split-window-below)
                (multi-term)
                (evil-emacs-state)
                )))
(evil-leader/set-key "Los" 'custom-persp/shell)

(defun custom-persp/elfeed ()
  (interactive)
  (custom-persp "elfeed" (progn
                           (elfeed)
                           (elfeed-update)
                           )))
(evil-leader/set-key "Lof" 'custom-persp/elfeed)

(defun custom-persp/deft ()
  (interactive)
  (custom-persp "deft" (progn
                         (deft)
                         )))
(evil-leader/set-key "Lod" 'custom-persp/deft)


;; Source: http://endlessparentheses.com/automatically-configure-magit-to-access-github-prs.html
(defun kostajh/add-PR-fetch ()
  "If refs/pull is not defined on a GH repo, define it."
  (let ((fetch-address
         "+refs/pull/*/head:refs/pull/origin/*"))
    (unless (member
             fetch-address
             (magit-get-all "remote" "origin" "fetch"))
      (when (string-match
             "github" (magit-get "remote" "origin" "url"))
        (magit-git-string
         "config" "--add" "remote.origin.fetch"
         fetch-address)))))

(add-hook 'magit-mode-hook #'kostajh/add-PR-fetch)

(defun helm-harvest-search ()
  (defun slurp (f)
  (with-temp-buffer
    (insert-file-contents f)
    (buffer-substring-no-properties
       (point-min)
       (point-max))))
  (split-string
    (slurp "~/.harvest.tasks.txt") "\n" t))

(defun helm-harvest-actions-for-task (actions task)
    "Return a list of helm ACTIONS available for this TASK."
    `((,(format "Log time - %s" task) . harvest-log-time)))

(defun harvest-log-time (task)
  (let ((components (s-split "\\s-" task t)))
    (let ((project_id (nth 0 components)))
      (let ((task_id (nth 1 components)))
        ;; TODO: Get description from org task
        (let ((task_description (read-from-minibuffer "Description: ")))
        ;; TODO: Get time from org task
        (let ((time_logged (read-from-minibuffer "Time: ")))
        (let ((command (format "hcl log %d %d +%s %s" (string-to-number project_id) (string-to-number task_id) time_logged task_description)))
        (async-shell-command command)
        ;; TODO: Prompt to archive task.
        (async-shell-command "notify-send 'harvest' 'Logged time!'"))))))))

(defun harvest-status()
  (switch-to-buffer-other-window "*harvest-status*")
  (erase-buffer)
  (shell-command "hcl" nil "*harvest-status*")
  (other-window 1)
  )

(defvar helm-source-harvest-task-search
    '((name . "Harvest")
    (candidates-process . helm-harvest-search)
    (action-transformer . helm-harvest-actions-for-task)))

(defun helm-harvest ()
    "Log times in Harvest."
    (interactive)
    (helm :sources '(helm-source-harvest-task-search)
          :prompt "Task: "
    :buffer "*helm-harvest*"))

;; Enable flycheck for the following modes
;; (dolist (mode '(php
;;                 drupal
;;                 html
;;                 json
;;                 yaml))
;;   (add-hook (intern (concat (symbol-name mode) "-mode-hook"))
;;             'flycheck-mode))

;; Org
(setq org-src-fontify-natively t)
(setq jiralib-url "https://savasco.atlassian.net")
(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-agenda-files (quote ("~/org"
                               "~/.org-jira"
                               "~/org/notes"
                               "~/org/unc"
                               "~/org/pacmat"
                               "~/org/mitpress")))
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)" "LOGGED(l)" "CANCELLED(c@/!)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "PHONE" "MEETING" "APPOINTMENT"))))

(setq org-agenda-skip-scheduled-if-done t)

(setq org-agenda-include-diary t)

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("LOGGED" ("DONE") ("WAITING") ("HOLD") ("CANCELLED"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

; Auto-save buffers
;; (add-hook 'org-agenda-mode-hook
;;           (lambda ()
;;             (add-hook 'auto-save-hook 'org-save-all-org-buffers nil t)
;;             (auto-save-mode)))

; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)

;; Colors.
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "#d33682" :weight bold)
              ("NEXT" :foreground "#cb4b16" :weight bold)
              ("DONE" :foreground "#859900" :weight bold)
              ("WAITING" :foreground "#b58900" :weight bold)
              ("HOLD" :foreground "#6c71c4" :weight bold)
              ("CANCELLED" :foreground "#859900" :weight bold)
              ("MEETING" :foreground "#859900" :weight bold)
              ("PHONE" :foreground "#859900" :weight bold))))

;; (add-hook 'org-mode-hook 'auto-save-mode)

;; Programming hooks
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
;; (add-hook 'prog-mode-hook 'ggtags-mode)

;; @see https://github.com/arnested/drupal-mode/issues/48
;;(add-hook 'drupal-mode-hook 'setq drupal-get-function-args t)
(add-hook 'find-file-hook 'auto-insert)

;; Deft
(defvar deft-extension "org")
(defvar deft-directory "~/org/notes")
(defvar deft-text-mode 'org-mode)
(defvar deft-use-filename-as-title t)

;; Sass
(setq-default scss-compile-at-save nil)

;; mu4e
(eval-after-load 'mu4e
  '(progn
     (setq
      mu4e-maildir       "~/mail"   ;; top-level Maildir
      mu4e-sent-folder   "/fastmail/INBOX.Sent Items"       ;; folder for sent messages
      mu4e-drafts-folder "/fastmail/INBOX.Drafts"     ;; unfinished messages
      mu4e-trash-folder  "/fastmail/INBOX.Trash"      ;; trashed messages
      mu4e-refile-folder "/fastmail/INBOX.Archive"   ;; saved messages
      mu4e-get-mail-command "offlineimap -q"
      mu4e-update-interval nil
      mu4e-compose-signature-auto-include t
      )
    (setq mu4e-user-mail-address-list (list "kosta@kostaharlan.net" "kosta@savaslabs.com" "kostajh@gmail.com" "kosta@embros.org" "kostaharlan@gmail.com"))

     (defun no-auto-fill ()
       "Turn off auto-fill-mode."
       (auto-fill-mode -1))

     (add-hook 'mu4e-compose-mode-hook #'no-auto-fill)

     (setq message-send-mail-function 'smtpmail-send-it)
     (setq smtpmail-smtp-server "mail.messagingengine.com")
     (setq smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg"))
     (setq smtpmail-default-smtp-server "mail.messagingengine.com")
     (setq smtpmail-local-domain "kostaharlan.net")
     (setq user-full-name "Kosta Harlan")
     (setq user-mail-address "kosta@kostaharlan.net")
     (setq gnutls-algorithm-priority "NORMAL:%COMPAT")
     (setq smtpmail-stream-type 'ssl)
     (setq smtpmail-smtp-service 465)
     (setq mml2015-use 'epg)
     (setq mu4e-attachment-dir  "~/Downloads")
     (setq mu4e-maildir-shortcuts
           '( ("/fastmail/INBOX"     . ?i)
              ("/fastmail/INBOX.Archive"   . ?a)
              ("/fastmail.Sent Items"      . ?e)
              ("/savaslabs/INBOX"  . ?s)
           ))

     ;; enable inline images
     (setq mu4e-view-show-images t)
     ;; use imagemagick, if available
     (when (fboundp 'imagemagick-register-types)
       (imagemagick-register-types))
     (require 'mu4e-contrib)
     (setq mu4e-html2text-command 'mu4e-shr2text)

     (setq message-kill-buffer-on-exit t)

     (add-to-list 'mu4e-bookmarks
                  '("to:kosta@savaslabs.com"           "savas"          ?i) t)
     (defvar my-mu4e-account-alist
       '(("fastmail"
          (mu4e-sent-folder "/fastmail/INBOX.Sent Items")
          (mu4e-drafts-folder "/fastmail/INBOX.Drafts")
          (mu4e-trash-folder "/fastmail/INBOX.Trash")
          (mu4e-refile-folder "/fastmail/INBOX.Archive")
          (user-mail-address "kosta@kostaharlan.net")
          (smtpmail-default-smtp-server "mail.messagingengine.com")
          (smtpmail-local-domain "kostaharlan.net")
          (smtpmail-smtp-user "kosta@fastmail.com")
          (mu4e-compose-signature "kosta@kostaharlan.net")
          (smtpmail-smtp-server "mail.messagingengine.com")
          (smtpmail-stream-type ssl)
          (smtpmail-smtp-service 465))
         ("savaslabs"
          (mu4e-sent-folder "/savaslabs/[Gmail].Sent Mail")
          (mu4e-drafts-folder "/savaslabs/[Gmail].Drafts")
          (mu4e-trash-folder "/savaslabs/[Gmail].Trash")
          (mu4e-refile-folder "/savaslabs/[Gmail].All Mail")
          (user-mail-address "kosta@savaslabs.com")
          (smtpmail-default-smtp-server "smtp.gmail.com")
          (smtpmail-local-domain "savaslabs.com")
          (smtpmail-smtp-user "kosta@savaslabs.com")
          (smtpmail-smtp-server "smtp.gmail.com")
          (smtpmail-stream-type starttls)
          (mu4e-compose-signature "Kosta Harlan\ndirector of technology\nhttp://savaslabs.com")
          (smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil)))
          (user-mail-address "kosta@savaslabs.com")
          (user-full-name "Kosta Harlan")
          (smtpmail-smtp-service 587))))

     (defun my-mu4e-set-account ()
       "Set the account for composing a message."
       (let* ((account
               (if mu4e-compose-parent-message
                   (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                     (string-match "/\\(.*?\\)/" maildir)
                     (match-string 1 maildir))
                 (completing-read (format "Compose with account: (%s) "
                                          (mapconcat #'(lambda (var) (car var))
                                                     my-mu4e-account-alist "/"))
                                  (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                                  nil t nil nil (caar my-mu4e-account-alist))))
              (account-vars (cdr (assoc account my-mu4e-account-alist))))
         (if account-vars
             (mapc #'(lambda (var)
                       (set (car var) (cadr var)))
                   account-vars)
           (error "No email account found"))))

     (add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account 'company-mode-on)
     ;; (add-hook 'mu4e-index-updated-hook
     ;;     (lambda ()
     ;;       (shell-command (concat "/home/kosta/src/dotfiles/youve_got_mail.sh "
     ;;                              (number-to-string mu4e-update-interval)))))
     ))

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

(add-hook 'drupal-mode
          (lambda()
            (setq browse-url-browser-function (quote eww-browse-url))
          ))

;; Org present
(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                 (org-present-big)
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (org-present-read-only)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (org-present-small)
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (org-present-read-write)))))

(load-file "~/.emacs.d/.irc.el")

(evil-leader/set-key
    "aif" 'kostajh-irc-freenode
    "ais" 'kostajh-irc-slack)


