;; SPDX-License-Identifier: PMPL-1.0-or-later
;; ROADMAP.f0.scm - Foundation Phase (F0) Roadmap
;;
;; This file defines the foundation phase milestones for ephapax-playground.
;; F0 = Foundation: establish demo infrastructure, sample corpus, CI basics.

(define roadmap-f0
  '((phase . "f0-foundation")
    (status . "active")
    (target-date . "2026-Q1")
    (description . "Establish playground infrastructure with working demos and sample corpus.")

    (milestones
      . ((m0-scaffold
           ((name . "Repository Scaffold")
            (status . "completed")
            (deliverables
              . ("README.adoc with identity"
                 "STATE.scm project state"
                 "META.scm architecture decisions"
                 "justfile with RSR recipes"))))

         (m1-machine-readable
           ((name . "Machine-Readable Governance")
            (status . "in-progress")
            (deliverables
              . (".machine_read/LLM_SUPERINTENDENT.scm"
                 ".machine_read/ROADMAP.f0.scm"
                 ".machine_read/SPEC.playground.scm"))))

         (m2-demo-path
           ((name . "Demo Golden Path")
            (status . "planned")
            (deliverables
              . ("`just demo` runs offline"
                 "Mode toggle demonstration (linear vs affine)"
                 "samples/valid/ with passing examples"
                 "samples/invalid/ with failing examples"))))

         (m3-corpus
           ((name . "Conformance Mini-Corpus")
            (status . "planned")
            (deliverables
              . ("3+ valid examples (ownership, regions, mode toggle)"
                 "3+ invalid examples (use-after-move, linear-drop, etc.)"
                 "Corpus keyed to README sections"))))

         (m4-ci
           ((name . "CI Integration")
            (status . "planned")
            (deliverables
              . ("`just test` validates corpus"
                 "GitHub Actions workflow"
                 "GitLab CI pipeline"))))))

    (exit-criteria
      . ("All m0-m4 milestones completed"
         "`just demo` and `just test` pass"
         "README identity matches hub registry"
         "RSR bronze tier achieved"))

    (next-phase
      . ((name . "f1-silver")
         (prerequisites
           . ("CI fully operational"
              "Demo corpus complete"
              "Upstream ephapax pinned"))))))

;; Current focus
(define current-focus
  '((milestone . "m1-machine-readable")
    (task . "Complete SPEC.playground.scm with demo I/O contract")
    (blockers . ())))

;; Dependencies
(define dependencies
  '((upstream
      . ((repo . "hyperpolymath/ephapax")
         (required-for . "semantics/spec definitions")
         (status . "reference-only")))
    (tooling
      . ((just . "recipe runner")
         (guile . "scheme interpreter for .scm files")))))
