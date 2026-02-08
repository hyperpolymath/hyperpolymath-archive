;; SPDX-License-Identifier: PMPL-1.0-or-later
;; SPEC.playground.scm - Demo I/O Contract and Sample Corpus Layout
;;
;; This file defines the specification for the playground's demo system,
;; including input/output contracts and the sample corpus structure.

(define spec-playground
  '((version . "0.1.0")
    (purpose . "Define demo I/O contracts and sample corpus layout for ephapax-playground")

    ;; Demo I/O Contract
    (demo-contract
      . ((name . "just demo")
         (description . "Runs an offline demonstration of Ephapax linear/affine semantics")
         (requirements
           . ("Must run without network access"
              "Must demonstrate mode toggle (linear vs affine)"
              "Must show verifiable output"
              "Exit code 0 on success"))

         (input
           . ((source . "samples/")
              (format . ".epx files (Ephapax source)")
              (selection . "Runs curated demo set from samples/demo/")))

         (output
           . ((format . "structured text to stdout")
              (sections
                . ("=== Mode: linear ==="
                   "=== Mode: affine ==="
                   "=== Summary ==="))
              (exit-codes
                . ((0 . "success")
                   (1 . "demo failure")
                   (2 . "missing samples")))))

         (example-output . "
=== Mode: linear ===
[PASS] ownership_transfer.epx - resource moved correctly
[PASS] region_allocation.epx - region cleaned up
[FAIL] linear_drop.epx - ERROR: resource dropped without use (expected)

=== Mode: affine ===
[PASS] ownership_transfer.epx - resource moved correctly
[PASS] region_allocation.epx - region cleaned up
[WARN] affine_drop.epx - resource dropped (warning only)

=== Summary ===
Linear mode: 2 pass, 1 expected-fail
Affine mode: 3 pass, 0 fail
Demo complete.")))

    ;; Sample Corpus Layout
    (corpus-layout
      . ((root . "samples/")
         (structure
           . ((valid
                . ((path . "samples/valid/")
                   (description . "Examples that should compile/check successfully")
                   (minimum . 3)
                   (categories
                     . ("ownership_transfer" "region_allocation" "mode_toggle"))))

              (invalid
                . ((path . "samples/invalid/")
                   (description . "Examples that should fail (compile errors)")
                   (minimum . 3)
                   (categories
                     . ("use_after_move" "linear_drop" "double_use"))))

              (demo
                . ((path . "samples/demo/")
                   (description . "Curated examples for `just demo`")
                   (contents . "Symlinks or copies from valid/ and invalid/")))))))

    ;; Corpus-to-README Mapping
    (corpus-readme-mapping
      . ((mode-toggle
           . ((readme-section . "== Mode Toggle")
              (samples . ("samples/valid/mode_toggle.epx"
                          "samples/demo/mode_linear.epx"
                          "samples/demo/mode_affine.epx"))))

         (ownership-transfer
           . ((readme-section . "== Ownership Transfer")
              (samples . ("samples/valid/ownership_transfer.epx"
                          "samples/invalid/use_after_move.epx"
                          "samples/invalid/double_use.epx"))))

         (linear-types
           . ((readme-section . "== Linear Types")
              (samples . ("samples/valid/linear_resource.epx"
                          "samples/invalid/linear_drop.epx"))))

         (affine-types
           . ((readme-section . "== Affine Types")
              (samples . ("samples/valid/affine_resource.epx"))))

         (regions
           . ((readme-section . "== Region-Based Memory")
              (samples . ("samples/valid/region_allocation.epx"))))))

    ;; Test Contract
    (test-contract
      . ((name . "just test")
         (description . "Validates sample corpus against expected outcomes")
         (input . "samples/valid/ and samples/invalid/")
         (output
           . ((format . "test results to stdout")
              (exit-codes
                . ((0 . "all tests pass")
                   (1 . "test failures")))))
         (requirements
           . ("All samples/valid/*.epx must check successfully"
              "All samples/invalid/*.epx must produce expected errors"
              "Tests run offline"))))))

;; File naming conventions
(define naming-conventions
  '((source-extension . ".epx")
    (valid-prefix . "")
    (invalid-categories
      . ((use_after_move . "UAM")
         (linear_drop . "LD")
         (double_use . "DU")
         (escape_region . "ER")))
    (expected-error-annotation . ";; EXPECT-ERROR: <error-type>")))

;; Verification hooks
(define verification
  '((pre-commit
      . "All samples must have valid syntax (even invalid/ samples have valid syntax, just semantic errors)")
    (ci-check
      . "Run `just test` on every PR")
    (corpus-completeness
      . "Minimum 3 valid, 3 invalid samples")))
