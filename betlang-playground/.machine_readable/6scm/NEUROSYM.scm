;; SPDX-License-Identifier: PMPL-1.0-or-later
;; NEUROSYM.scm - Neurosymbolic integration config

(define neurosym-config
  `((version . "1.0.0")
    (project . "betlang-playground")
    (symbolic-layer
      ((type . "scheme")
       (reasoning . "deductive")
       (verification . "experimental")
       (language-specific
         ((features . "flag-controlled")
          (syntax . "mutable")
          (semantics . "experimental")))))
    (neural-layer
      ((embeddings . #f)
       (fine-tuning . #f)
       (inference . #f)))
    (integration
      ((ai-assisted-development . "duet-style")
       (experiment-suggestions . #t)))))
