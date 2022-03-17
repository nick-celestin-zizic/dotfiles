(defconst oxide-mode-syntax-table
  (with-syntax-table (copy-syntax-table)
    ;; C/C++ style comments
	(modify-syntax-entry ?\; "<")
	;;(modify-syntax-entry ?* ". 23")
	(modify-syntax-entry ?\n ">")
    (syntax-table))
  "Syntax table for `oxide-mode'.")

(eval-and-compile
  (defconst oxide-keywords
    '("let" "let*" "proc" "func" "macro" "label" "jump" "if" "else" "return" "struct" "enum" "tuple" "set" "while")))

(eval-and-compile
  (defconst oxide-intrinsics
    '("syscall" "inc" "dec" "shr" "shl" "offset")))

(defconst oxide-highlights
  `((,(regexp-opt oxide-keywords   'symbols) . font-lock-keyword-face)
    (,(regexp-opt oxide-intrinsics 'symbols) . font-lock-builtin-face)
    ("[ \n\t][A-Z][a-zA-_Z0-9]*"             . 'font-lock-type-face)
    ("[ \n\t][0-9]*"                         . 'font-lock-constant-face)))

;;;###autoload
(define-derived-mode oxide-mode prog-mode "oxide"
  "Major Mode for editing Oxide source code."
  (setq font-lock-defaults '(oxide-highlights))
  (setq abbrev-mode t)
  (set-syntax-table oxide-mode-syntax-table)
  (set (make-local-variable 'comment-start) "; ")
  (set (make-local-variable 'comment-end) "")
  (set (make-local-variable 'block-comment-start) ";-- ")
  (set (make-local-variable 'block-comment-end) ";- ")
  (set (make-local-variable 'comment-padding) "")
  )

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.ox\\'" . oxide-mode))

(provide 'oxide-mode)
