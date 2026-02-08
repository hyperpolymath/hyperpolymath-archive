;; SPDX-License-Identifier: PMPL-1.0-or-later
;; PLAYBOOK.scm - Operational runbook

(define playbook
  `((version . "1.0.0")
    (project . "ephapax-playground")
    (procedures
      ((build
         (("setup" . "cargo build")
          ("build" . "cargo build --release")
          ("test" . "cargo test")))
       (linear
         (("check" . "cargo run -- --linear-check src/main.eph")
          ("verify" . "cargo run -- --verify src/main.eph")))
       (run
         (("example" . "cargo run -- examples/ephemeral.eph")))))
    (alerts ())
    (contacts ())))
