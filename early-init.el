;; Startup speed
(setq gc-cons-percentage 0.6)
(setq gc-cons-threshold most-positive-fixnum)

(setq inhibit-startup-echo-area-message (user-login-name))  ; Don't show startup message in the echo area
(setq inhibit-startup-message t)                            ; Don't show the startup screen
(setq initial-buffer-choice nil)                            ; Don't show a buffer after starting Emacs
(setq initial-major-mode 'fundamental-mode)                 ; Default mode for the *scratch* buffer
(setq initial-scratch-message nil)                          ; Scratch buffer should be empty
(setq auto-save-default nil)                                ; Don't auto-save buffers
(setq create-lockfiles nil)                                 ; Don't create those .#xxxxx files
(setq make-backup-files nil)                                ; Don't make backup files
(setq frame-resize-pixelwise t)                             ; When resizing the Emacs window, change by pixels not by characters.
(setq package-enable-at-startup nil)                        ; We're already using straight/use-package, don't use package.el
(setq default-frame-alist '((fullscreen . maximized)
                            (vertical-scroll-bars . nil)
                            (horizontal-scroll-bars . nil)
                            (ns-transparent-titlebar . t)))

(tool-bar-mode -1)             ; All these tools are in the menu-bar anyway
(setq frame-title-format nil)  ; Don't show the filename in the title bar
(setq ns-use-proxy-icon nil)   ; Don't show file icon in title bar (MacOS only)
(setq ns-pop-up-frames nil)    ; On external request to open file, use current frame (MacOS only)
