(add-to-list 'load-path "~/.emacs.local/")

; for rc-require
(load "~/.emacs.rc/rc.el")

; set emacs default font
(set-frame-font "Iosevka 11" nil t)

; simpc-mode
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

; custom-emacs-edited-file
(setq custom-file "~/.emacs.custom.el")
(setq display-line-numbers-type 'relative)

; basic configuration
(ido-mode 1)
(ido-everywhere 1)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode)

; multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

; smex (ido mode but for alt-x)
(rc/require 'smex)
(global-set-key (kbd "M-x") 'smex)

; language packages (can be modified) [no need for configuration]
(rc/require
 'basic-mode
 'lua-mode
 'glsl-mode
 'rust-mode
 'cmake-mode
 'csharp-mode
 'nim-mode
 'toml-mode
 'go-mode
 'php-mode
 'typescript-mode
 'sml-mode
)

; duplicate lines
(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(global-set-key (kbd "C-,") 'rc/duplicate-line)

; move text
(rc/require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

; load the custom-emacs-edited-file
(load-file custom-file)
