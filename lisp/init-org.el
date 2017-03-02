(setq org-modules '(org-habit))

(setq org-directory "E:/nutstore/org")

(setq org-todo-keywords '((sequence "TODO(t)" "STARTED(s)" "WAITING(w@/!)" "SOMEDAY" "|" "CANCLED(c@)" "DONE(d!)")))

(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "green" :weight bold))
        ("DONE" . (:foreground "cyan" :weight bold))
        ("WAITING" . (:foreground "red" :weight bold))
        ("SOMEDAY" . (:foreground "gray" :weight bold))))

(setq org-agenda-files (mapcar (lambda (filename)
                                 (concat org-directory "/" filename))
                               '("gtd.org"
                                 "work.org"
                                 "God.org"
                                 "scratch.org"
                                 "notes.org"     ; notes
                                 "learning.org" ; learning plan
                                 "idea.org"
                                 "people.org"
                                 "book.org"
                                 "routine.org"
                                 )))

(setq org-log-done 'time) ;;默认任务完成，只需要插入时间，如果情况特殊，需要加note，使用org-add-note
(setq org-catch-invisible-edits 'show)

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c b") 'org-switchb)
(define-key global-map (kbd "C-c c") 'org-capture)

;; speed-commands
(defun my/org-use-speed-commands-for-headings-and-lists ()
  "Activate speed commands on list items too."
  (or (and (looking-at org-outline-regexp) (looking-back "^\**"))
      (save-excursion (and (looking-at (org-item-re)) (looking-back "^[ \t]*")))))
(setq org-use-speed-commands 'my/org-use-speed-commands-for-headings-and-lists)
(eval-after-load "org" (progn
                         (add-to-list 'org-speed-commands-user '("x" org-todo "DONE"))
                         (add-to-list 'org-speed-commands-user '("y" org-todo-yesterday "DONE"))
                         (add-to-list 'org-speed-commands-user '("!" my/org-clock-in-and-track))
                         (add-to-list 'org-speed-commands-user '("s" call-interactively 'org-schedule))
                         (add-to-list 'org-speed-commands-user '("d" my/org-move-line-to-destination))
                         (add-to-list 'org-speed-commands-user '("i" call-interactively 'org-clock-in))
                         (add-to-list 'org-speed-commands-user '("P" call-interactively 'org2blog/wp-post-subtree))
                         (add-to-list 'org-speed-commands-user '("o" call-interactively 'org-clock-out))
                         (add-to-list 'org-speed-commands-user '("$" call-interactively 'org-archive-subtree))
                         (add-to-list 'org-speed-commands-user '("N" org-narrow-to-subtree))
                         (add-to-list 'org-speed-commands-user '("W" widen))))

;; capture
(setq org-capture-templates '(("t" "待处理的任务" entry (file+headline "~/private/me/orgaziner.org" "Inbox") "* TODO %^{Task}")
                              ))

;; refile
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 3))))

;; archive
(setq org-archive-location (concat org-directory "/" "archive.org::* From %s"))


;; Mobile
(setq exec-path (append exec-path '("C:/Program Files/Git/usr/bin")))

(setq org-mobile-checksum-binary (or (executable-find "shasum")
                                     (executable-find "sha1sum")
                                     (executable-find "md5sum")
                                     (executable-find "md5")))

(setq org-mobile-directory (concat org-directory "/" "mobile"))

;;(setq org-mobile-files org-agenda-files)

(setq org-mobile-inbox-for-pull (concat org-directory "/" "capture.org"))

(require 'chinese-fonts-setup) ;;解决在org table里中英文对齐的的问题

(provide 'init-org)
