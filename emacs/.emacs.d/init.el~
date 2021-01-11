;; setting up melpa
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; bootstrapping use-lackage
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; manually installing theme
(unless (package-installed-p 'molokai-theme)
  (package-refresh-contents)
  (package-install 'molokai-theme))

;; fixes packages not downloading
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; load config file
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; generated
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (molokai)))
 '(custom-safe-themes
   (quote
    ("8f567db503a0d27202804f2ee51b4cd409eab5c4374f57640317b8fcbbd3e466" default)))
 '(package-selected-packages (quote (org-bullets beacon molokai-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
