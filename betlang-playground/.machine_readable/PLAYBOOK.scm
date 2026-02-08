;; SPDX-License-Identifier: PMPL-1.0-or-later
;; PLAYBOOK.scm - Operational runbook

(define playbook
  `((version . "1.0.0")
    (project . "betlang-playground")
    (procedures
      ((build
         (("setup" . "cargo build")
          ("test" . "cargo test")
          ("check" . "cargo check")))
       (run
         (("repl" . "cargo run -- repl")
          ("example" . "cargo run -- examples/experiment.bet")))
       (experiment
         (("enable" . "cargo run -- --feature=linear_types examples/test.bet")
          ("list" . "cargo run -- --list-features")))))
    (alerts ())
    (contacts ())))
