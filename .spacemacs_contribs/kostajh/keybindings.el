(global-set-key [f11] 'mu4e)
(global-set-key [f8] 'deft)
(global-set-key (kbd "C-c t e m") 'evil-mode)

;; Org
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "<f12>") 'org-agenda)

;; ggtags bindings
(evil-leader/set-key
   "ggv" 'ggtags-find-tag-dwim
   "ggd" 'ggtags-find-definition
   "ggr" 'ggtags-find-reference
   "ggp" 'ggtags-prev-mark
   "ggn" 'ggtags-next-mark
   )

;; jabber bindings
(evil-leader/set-key
  "jl" 'jabber-activity-switch-to
  "jr" 'jabber-switch-to-roster-buffer
  "jw" 'jabber-chat-with
  "jd" 'jabber-disconnect
  "jc" 'jabber-connect
  "ja" 'jabber-connect-all
  )
