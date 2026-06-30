;; -*- mode: emacs-lisp; lexical-binding: t; -*-
;; Tangled from config.org — do not edit directly, edit config.org instead.

(doom! :completion
       vertico

       :ui
       doom
       doom-dashboard
       modeline

       :editor
       (evil +everywhere)

       :tools
       magit

       :lang
       (org)
       emacs-lisp)
