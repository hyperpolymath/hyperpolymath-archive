;; SPDX-License-Identifier: PMPL-1.0-or-later
;; AGENTIC.scm - AI agent interaction patterns

(define agentic-config
  `((version . "1.0.0")
    (project . "betlang-playground")
    (claude-code
      ((model . "claude-opus-4-5-20251101")
       (tools . ("read" "edit" "bash" "grep" "glob"))
       (permissions . "read-all")))
    (patterns
      ((code-review . "thorough")
       (refactoring . "liberal")
       (testing . "comprehensive")
       (experimentation . "encouraged")))
    (constraints
      ((languages . ("rust" "scheme"))
       (banned . ("typescript" "go" "python" "makefile"))))
    (project-specific
      ((feature-flags . "document-all-experiments")
       (breaking-changes . "allowed-with-flag")))))
