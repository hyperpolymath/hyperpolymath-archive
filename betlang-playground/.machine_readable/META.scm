;; SPDX-License-Identifier: PMPL-1.0-or-later
;; META.scm - Project metadata and architecture decisions

(define project-meta
  `((version . "1.0.0")
    (name . "betlang-playground")
    (architecture-decisions
      ((adr-001
         ((status . "accepted")
          (date . "2025-12-30")
          (context . "Need experimental testbed for language features")
          (decision . "Use feature flags for rapid language experimentation")
          (consequences . "Fast iteration on new ideas before production")))))
    (development-practices
      ((code-style . "rust-standard")
       (security . "openssf-scorecard")
       (testing . "property-based")
       (versioning . "semver")
       (documentation . "asciidoc")
       (branching . "trunk-based")))
    (design-rationale
      ((why-experimental . "Research testbed for language ideas")
       (why-feature-flags . "Enable/disable features dynamically")
       (why-rapid . "Quick iteration on syntax experiments")))))
