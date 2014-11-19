(global-set-key [f11] 'mu4e)
(global-set-key [f8] 'deft)
(global-set-key (kbd "C-c t e m") 'evil-mode)

;; ggtags bindings
(evil-leader/set-key
   "gv" 'ggtags-find-tag-dwim
   "gd" 'ggtags-find-definition
   "gr" 'ggtags-find-reference
   "gp" 'ggtags-prev-mark
   "gn" 'ggtags-next-mark
   )

;; jabber bindings
(evil-leader/set-key
  "jl" 'jabber-activity-switch-to
  "jr" 'jabber-switch-to-roster-buffer
  "jc" 'jabber-chat-with
  "jd" 'jabber-disconnect
  "jj" 'jabber-connect-all
  )
