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
 '(custom-enabled-themes (quote (manoj-dark)))
 '(package-selected-packages (quote (go-mode)))
 '(save-place t nil (saveplace))
 '(tool-bar-mode nil)
 '(transient-mark-mode (quote (only . t))))

(setq visible-bell 1)

(set-frame-font "Noto Mono 16" nil t)

;; add line numbers
(global-linum-mode t)
(setq linum-format "%d ")

;; add column number
(setq column-number-mode t)

;; Unsure how to make this work for Linux and Mac
;; (setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "google-chrome")

(setq browse-url-browser-function 'browse-url-default-macosx-browser)


(setq inhibit-startup-screen t)


;org mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-agenda-files '("~/org"))

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
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; org export to Confluence wiki markup
(require 'ox-confluence)
