(setq org-modules '(org-habit))

(setq org-directory "E:/nutstore/org")
(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w@/!)" "|" "CANCLED(c@)" "DONE(d!)")))


(setq org-agenda-files (mapcar (lambda (filename)
                                 (concat org-directory "/" filename))
                               '("orgaziner.org"
                                 "plan.org"
                                 "work.org"
                                 "God.org"
                                 "scratch.org"
                                 "wiki.org"
                                 "learning.org"
                                 "idea.org"
                                 "family.org"
                                 "book.org"
                                 )))

(setq org-archive-location (concat org-directory "/" "archive.org::* From %s"))

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c b") 'org-switchb)
(define-key global-map (kbd "C-c c") 'org-capture)

(setq org-log-done 'time) ;;默认任务完成，只需要插入时间，如果情况特殊，需要加note，使用org-add-note
(setq org-catch-invisible-edits 'show)

;; capture
(setq org-capture-templates '(("t" "待处理的任务" entry (file+headline "~/private/me/orgaziner.org" "Inbox") "* TODO %^{Task}")
                              ))

;; refile
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 3))))

(require 'chinese-fonts-setup) ;;解决在org table里中英文对齐的的问题

(provide 'init-org)
