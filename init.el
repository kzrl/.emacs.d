;; some dumb bug
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(add-to-list 'load-path "~/.emacs.d/lisp/")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes '(manoj-dark))
 '(package-selected-packages
   '(magit php-mode yaml-mode use-package mc-extras json-mode ivy go-mode flycheck company))
 '(save-place-mode t nil (saveplace))
 '(tool-bar-mode nil)
 '(transient-mark-mode '(only . t)))

(setq visible-bell 1)

(set-frame-font "Noto Mono 16" nil t)

;; add line numbers
(global-display-line-numbers-mode)
;;(setq linum-format "%d ")

;; add column number
(setq column-number-mode t)

(setq inhibit-startup-screen t)

;org mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-agenda-files '("~/org"))
(setq org-todo-keywords
      '((sequence "TODO" "INPROGRESS" "|" "DONE")))

;; Prompts for a URL like this:
;; https://jira.atlassian.com/browse/CONFDEV-56699
;; And adds this to your document:
;; [[https://jira.atlassian.com/browse/CONFDEV-56699][CONFDEV-56699]]
;; my first emacs func :D
(defun jiralink (string)
  "Insert orgmode link for a given jira ticket URL"
  (interactive "sticket URL: ")
  (insert "[[" string "][" (car (last (split-string string "/"))) "]]"))

;;
;; Using Emacs Package Manager: M-x list-packages
;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)



;; Bootstrap `use-package' -  https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)


;(use-package flycheck
;  :ensure t
;  :init (global-flycheck-mode))


(use-package markdown-mode
  :ensure mc-extras
  :ensure t
  :mode "\\.md\\'"
  :mode "\\.markdown\\'")

(use-package json-mode
  :ensure t
  :mode "\\.json\\'")

(use-package yaml-mode
  :ensure t
  :mode "\\.yaml\\'")

(use-package ivy
  :ensure t
  )

(ivy-mode 1)

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(use-package php-mode
  :ensure t
  :mode "\\.php\\'")

(use-package org-tempo)

;; (require 'ob-python)
;; Configure babel for these languages
(org-babel-do-load-languages
  'org-babel-load-languages
  '((python . t)
    (shell . t)
    (dot . t)
    (org . t)
    (scheme . t)
    (sql . t)
    ))
  
  
(setq org-babel-python-command "python3")

;; run code blocks without prompt
(setq org-confirm-babel-evaluate nil)


;; auto revert mode
(global-auto-revert-mode 1)

;; magit bindings
(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "s-g") 'vc-git-grep)

;; go-setup thanks to https://johnsogg.github.io/emacs-golang
;; Key bindings specific to go-mode
;; (global-set-key (kbd "M-.") 'godef-jump)         ; Go to definition
;; (global-set-key (kbd "M-*") 'pop-tag-mark)       ; Return from whence you came
(global-set-key (kbd "M-p") 'compile)            ; Invoke compiler
(global-set-key (kbd "M-P") 'recompile)          ; Redo most recent compile cmd
(global-set-key (kbd "M-]") 'next-error)         ; Go to next error (or msg)
(global-set-key (kbd "M-[") 'previous-error)     ; Go to previous error or msg



;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


(setq create-lockfiles nil)


;; lsp-mode has wasted a bunch of my time
(setq read-process-output-max (* 1024 1024)) ;; 1mb
;; (setq lsp-completion-provider :capf)
(setq gc-cons-threshold 100000000)


;; Allow emacs to see the system clipboard
(setq select-enable-clipboard t)
