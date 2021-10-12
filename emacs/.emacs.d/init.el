;; setting up melpa
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" .   "http://elpa.gnu.org/packages/")))
(package-initialize)

;; bootstrapping use-lackage
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t)

;; manually installing theme

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
 '(auth-source-save-behavior nil)
 '(custom-enabled-themes '(kaolin-ocean))
 '(custom-safe-themes
   '("35c096aa0975d104688a9e59e28860f5af6bb4459fd692ed47557727848e6dfe" "f490984d405f1a97418a92f478218b8e4bcc188cf353e5dd5d5acd2f8efd0790" "e58e0bd0ca1f1a8c1662aeb17c92b7fb49ed564aced96435c64df608ee6ced6d" "98db748f133d9bb82adf38f8ae7834eefa9eefd6f7ea30909213164e1aa36df6" "5291f0f582034afcc93ba4ff66a1c3d598c2c8d67279acf0f03834cb50760f3f" "78c01e1b7f3dc9e47bdd48f74dc98dc1a345c291f83b68ac8a1b40191f24d658" "73320ccc14ab4987fe2e97cfd810b33a1f4a115f5f056c482c3d38a4429e1705" "17a58e509bbb8318abf3558c4b7b44273b4f1b555c5e91d00d4785b7b59d6d28" "8f54cfa3f010d83d782fbcdc3a34cdc9dfe23c8515d87ba22d410c033160ad7e" "7e5d400035eea68343be6830f3de7b8ce5e75f7ac7b8337b5df492d023ee8483" "0c6a36393d5782839b88e4bf932f20155cb4321242ce75dc587b4f564cb63d90" "620b9018d9504f79344c8ef3983ea4e83d209b46920f425240889d582be35881" "0769aa1641a0dcd5043e37ab22c401da838ff30b015da104c87cce1573d4c3ef" "7236acec527d58086ad2f1be6a904facc9ca8bf81ed1c19098012d596201b3f1" "a4395e069de3314001de4e139d6a3b1a83dcf9c3fdc68ee7b13eef6c2cba4ae3" "d9a28a009cda74d1d53b1fbd050f31af7a1a105aa2d53738e9aa2515908cac4c" "fc6697788f00629cd01f4d2cc23f1994d08edb3535e4c0facef6b7247b41f5c7" "5d59bd44c5a875566348fa44ee01c98c1d72369dc531c1c5458b0864841f887c" "2d035eb93f92384d11f18ed00930e5cc9964281915689fa035719cab71766a15" "28a104f642d09d3e5c62ce3464ea2c143b9130167282ea97ddcc3607b381823f" "8f567db503a0d27202804f2ee51b4cd409eab5c4374f57640317b8fcbbd3e466" default))
 '(fci-rule-color "#dedede")
 '(fira-code-mode-disabled-ligatures '("[]" "x") nil nil "Customized with use-package fira-code-mode")
 '(hl-sexp-background-color "#efebe9")
 '(line-spacing 0.2)
 '(linum-format " %5i ")
 '(package-selected-packages
   '(transient magit slime-mode slime lua-mode racer flycheck-rust cargo lsp-mode ht gnu-elpa-keyring-update haskell-mode fira-code-mode popup-kill-ring diminish kaolin-themes tangotango-theme naysayer-theme poet-theme company dashboard sudo-edit hungry-delete rainbow-mode rainbow avy smex ido-vertical-mode ido-vertical-mod org-bullets beacon molokai-theme use-package))
 '(pos-tip-background-color "#1d1d2b")
 '(pos-tip-foreground-color "#d4d4d6"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
