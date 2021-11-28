;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ralph Bacolod"
      user-mail-address "rab@devsphoto.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "/Volumes/uploads/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Ralphs customization
;; 07/08/2020
;;

(setq-default evil-escape-key-sequence "hh")
(setq-default evil-escape-delay 0.2)
;;(map! :n "j" nil)
;;(map! :n "h" nil)
;;;(map! :n "k" nil)
;;(map! :n "l" nil)
;;
;;
;;org-publish
;;
(require 'ox-publish)
(setq org-publish-project-alist
      '(
        ;; add all components below here ....
        ("org-notes"
         :base-directory "/Volumes/uploads/org/projects/blog"
         :base-extension "org"
         :publishing-directory "~/public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-preamble t
         )
        ("journal"
         :base-directory "/Volumes/uploads/org/projects/blog/journal"
         ;;:base-extension "org"
         :publishing-directory "~/public_html/"
         :recursive t
         :section-numbers nil
         :publishing-function org-html-publish-to-html
         )
        ("org-static"
         :base-directory "/Volumes/uploads/org/projects/blog"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/public_html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org"
         :components ("journal" "org-notes" "org-static"))
        )
      )


;; org-journal settings
;;
(setq org-journal-dir "/Volumes/uploads/org/projects/blog/journal")
(setq org-journal-file-type "Yearly")
(setq org-journal-file-format "%Y.org")

;; org-mode customizations
;;
;;
(setq org-mobile-directory "/Volumes/uploads/MobileOrg")
(setq org-mobile-inbox-for-pull "/Volumes/uploads/org/flagged.org")
(setq org-agenda-files
      (delq nil
            (mapcar (lambda (x) (and (file-exists-p x) x))
                    '("/Volumes/uploads/org/gtd.org"
                      "/Volumes/uploads/org/work.org"
                      "/Volumes/uploads/org/notes.org"
                      "/Volumes/uploads/org/flagged.org"
                      "/Volumes/uploads/org/personal/business.org"
                      "/Volumes/uploads/org/personal/organizer.org"
                      "/Volumes/uploads/org/routines.org"
                      ))))

;;RTAGS
;;
;; (require 'rtags) ;; optional, must have rtags installed
;;  (cmake-ide-setup)

;;  (setq cmake-ide-flags-c++ "/Library/Developer/CommandLineTools/usr/include/c++/v1")
;;  (setq cmake-ide-build-dir "/Users/rafiks/my-sandbox/C/cmake_ide_projects")
;;  (setq cmake-ide-rdm-executable "/usr/local/bin/rdm")
;;  (setq cmake-ide-rc-executable "/usr/local/bin/rc")
;;  (setq cmake-ide-cmake-command "/usr/local/bin/cmake")
;;  (setq cmake-ide-build-pool-dir "/Users/rafiks/my-sandbox/C/cmake_ide_projects/pool")

;; Gnugol
;; (defalias 'insert-string 'insert)
;; (require 'gnugol)
;;  (setq gnugol-default-output-buffer "/Volumes/uploads/org/gnugol_history.org")

;; emacs maximized screen
;;
;;
(setq ns-use-native-fullscreen t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; company changing bindings
(map! :after company (:map company-active-map
                      ("<tab>" #'company-complete-selection))
      (:map lsp-mode-map
       ("<tab>" #'company-indent-or-complete-common)))
;;
;; magit setting
(setq magit-repository-directories '(("~/my-sandbox" . 7)))
(setq dap-python-debugger 'debugpy)
;;
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
