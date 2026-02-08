;; SPDX-License-Identifier: PMPL-1.0-or-later
;; NEUROSYM.scm - Neurosymbolic integration config

(define neurosym-config
  `((version . "1.0.0")
    (project . "ephapax-playground")
    (symbolic-layer
      ((type . "scheme")
       (reasoning . "deductive")
       (verification . "formal")
       (language-specific
         ((type-system . "linear")
          (grammar . "ebnf-defined")
          (semantics . "operational")))))
    (neural-layer
      ((embeddings . #f)
       (fine-tuning . #f)
       (inference . #f)))
    (integration
      ((ai-assisted-development . "duet-style")
       (linearity-hints . #t)))))
