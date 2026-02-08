;; SPDX-License-Identifier: PMPL-1.0-or-later
;; LLM_SUPERINTENDENT.scm - Anchor schema and governance for LLM agents
;;
;; This file is machine-readable guidance for AI/LLM agents operating on this repo.
;; It defines scope boundaries, identity constraints, and behavioral policies.

(define anchor
  '((schema . "hyperpolymath.anchor/1")
    (repo . "hyperpolymath/ephapax-playground")
    (date . "2026-01-01")
    (authority . "repo-superintendent")
    (purpose
      . ("Scope arrest: playground for Ephapax concepts (linear/affine, once-only evaluation)."
         "Prevent identity drift between satellite and hub registry."
         "Make one runnable, offline demo path."))

    (identity
      . ((project . "Ephapax Playground")
         (kind . "playground")
         (one-sentence . "Playground for Ephapax: linear/affine semantics and once-only evaluation.")
         (upstream . "hyperpolymath/ephapax")))

    (semantic-anchor
      . ((policy . "downstream")
         (upstream-authority
           . ("Ephapax semantics/spec live upstream; this repo only demos/validates."
              "The hub registry description must match this repo's README identity."))))

    (implementation-policy
      . ((allowed . ("Scheme" "Shell" "Just" "Deno" "ReScript" "Markdown" "AsciiDoc"))
         (quarantined . ("Any compiler/parser work (belongs upstream unless delegated)"))
         (forbidden
           . ("Rebranding into a different project category (e.g., 'framework')"
              "Network-required runtime for demos"))))

    (golden-path
      . ((smoke-test-command
           . ("just --list"
              "just demo   ;; must exist"
              "just test   ;; must exist"))
         (success-criteria
           . ("`just demo` runs offline and demonstrates the mode toggle (linear vs affine) in a verifiable output."
              "At least 3 'should fail' samples exist and are checked in CI."
              "README identity matches hub registry entry."))))

    (mandatory-files
      . ("./.machine_read/LLM_SUPERINTENDENT.scm"
         "./.machine_read/ROADMAP.f0.scm"
         "./.machine_read/SPEC.playground.scm"))

    (first-pass-directives
      . ("Add SPEC.playground.scm: define demo I/O contract and sample corpus layout."
         "Add conformance mini-corpus: valid/invalid examples keyed to README sections (mode toggle, ownership transfer, regions)."
         "Update hub entry for ephapax-playground if it says something else."))

    (rsr . ((target-tier . "bronze-now")
            (upgrade-path . "silver-after-f1 (CI + demo corpus + pinned upstream)")))))

;; Agent behavior constraints
(define agent-constraints
  '((identity-preservation
      . "Do not change the project's identity from 'playground' to any other kind (framework, library, etc.)")
    (upstream-deference
      . "Compiler/parser/spec changes belong in hyperpolymath/ephapax, not here.")
    (offline-first
      . "All demos MUST work without network access.")
    (scope-arrest
      . "This repo demonstrates Ephapax concepts; it does not define them.")))

;; Verification checklist for agents
(define verification-checklist
  '((smoke-test
      . "Run `just demo` and `just test` - both must succeed.")
    (identity-check
      . "README.adoc must describe this as a 'playground' for Ephapax.")
    (file-check
      . "All files in anchor.mandatory-files must exist.")
    (corpus-check
      . "samples/valid/ and samples/invalid/ must contain example code.")))
