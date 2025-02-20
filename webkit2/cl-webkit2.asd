;;; cl-webkit2.asd --- ASDF system definition

;; This file is part of cl-webkit.
;;
;; cl-webkit is free software; you can redistribute it and/or modify
;; it under the terms of the MIT license.
;; See `COPYING' in the source distribution for details.

;;; Code:

#-(or clisp sbcl ccl)
(warn "unsupported implementation, satisfaction uncertain!")

#-asdf3
(defpackage #:asdf-user (:use :cl :asdf))

(in-package :asdf-user)

(defsystem :cl-webkit2
  :description "An FFI binding to WebKit2GTK+"
  :author "Joachim Fasting <joachifm@fastmail.fm>"
  :licence "MIT"
  :version "3.5.8"
  :serial t
  :components ((:file "webkit2.package")
               (:file "util")
               (:file "translate")
               (:file "macros")
               (:file "callback")
               (:file "gerror")
               (:file "libsoup.message-headers")
               (:file "webkit2.init")
               (:file "webkit2.error")
               (:file "webkit2.authentication-request")
               (:file "webkit2.back-forward-list-item")
               (:file "webkit2.back-forward-list")
               (:file "webkit2.cookie-manager")
               (:file "webkit2.context-menu-item")
               (:file "webkit2.context-menu")
               (:file "webkit2.download")
               (:file "webkit2.favicon-database")
               (:file "webkit2.color-chooser-request")
               (:file "webkit2.file-chooser-request")
               (:file "webkit2.find-controller")
               (:file "webkit2.form-submission-request")
               (:file "webkit2.hit-test-result")
               (:file "webkit2.permission-request")
               (:file "webkit2.plugin")
               (:file "webkit2.print-operation")
               (:file "webkit2.script-world")
               (:file "webkit2.frame")
               (:file "webkitdom.dom-object")
               (:file "jscore.js-value-ref")
               (:file "jscore.jsc-exception")
               (:file "jscore.jsc-context")
               (:file "jscore.jsc-class")
               (:file "jscore.jsc-value")
               (:file "webkit2.security-manager")
               (:file "webkit2.settings")
               (:file "webkit2.uri-request")
               (:file "webkit2.uri-response")
               (:file "webkit2.policy-decision")
               (:file "webkit2.navigation-policy-decision")
               (:file "webkit2.response-policy-decision")
               (:file "webkit2.navigation-action")
               (:file "webkit2.user-content")
               (:file "webkit2.user-content-filter-store")
               (:file "webkit2.user-content-manager")
               (:file "webkit2.network-proxy-settings")
               (:file "webkit2.web-context")
               (:file "webkit2.web-page")
               (:file "webkit2.web-resource")
               (:file "webkit2.website-data-manager")
               (:file "webkit2.web-inspector")
               (:file "webkit2.web-view")
               (:file "webkit2.g-input-stream")
               (:file "webkit2.uri-scheme-response")
               (:file "webkit2.uri-scheme-request")
               (:file "webkit2.window-properties")
               (:file "webkit2.uri-utilities")
               (:file "webkit2.user-message")
               (:file "webkit2.web-extension")
               (:file "jsc-utils")
               (:file "webkit2.notification"))
  :depends-on (:alexandria :cffi :cl-cffi-gtk)
  :in-order-to ((test-op (test-op :cl-webkit2/test))))

(defsystem :cl-webkit2/test
  :description "CL-WebKit tests, mainly to check JS result conversion."
  :depends-on (:cl-webkit2 :fiveam :calispel :float-features)
  :pathname "tests/"
  :components ((:file "package")
               (:file "tests"))
  :perform (test-op (o c) (symbol-call :webkit2/tests :run-tests)))
