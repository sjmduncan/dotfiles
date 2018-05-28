(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(setq org-log-done 'note)
(setq org-closed-keep-when-no-todo 0)
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
(require 'package)
(add-to-list 'package-archives
	     '(("melpa" . "http://melpa.org/packages/")
	       ("gnu" . "http://elpa.gnu.org/packages/")
	       ("org" . "http://orgmode.org/elpa/")))

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (adwaita)))
 '(custom-safe-themes
   (quote
    ("2caab17a07a40c1427693d630adb45f5d6ec968a1771dcd9ea94a6de5d9f0838" default)))
 '(org-startup-truncated nil)
 '(package-selected-packages
   (quote
    (darktooth-theme yaml-mode rainbow-delimiters org-plus-contrib htmlize ##)))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq org-src-fontify-natively t)
