;; SPDX-License-Identifier: PMPL-1.0-or-later
;; ECOSYSTEM.scm - Ecosystem positioning

(ecosystem
  (version . "1.0.0")
  (name . "betlang-playground")
  (type . "language-playground")
  (purpose . "Foundational experimental language testbed")

  (position-in-ecosystem
    ((parent . "language-playgrounds")
     (grandparent . "nextgen-languages")
     (category . "experimental-languages")))

  (related-projects
    ((mylang-playground
       ((relationship . "sibling-standard")
        (description . "Progressive type system from Me to Ensemble")))
     (all-playgrounds
       ((relationship . "testing-ground")
        (description . "Features tested here may migrate to others")))))

  (what-this-is
    ("Experimental language sandbox"
     "Feature flag driven development"
     "Syntax experimentation"))

  (what-this-is-not
    ("Production language"
     "Stable API"
     "Backwards compatible")))
