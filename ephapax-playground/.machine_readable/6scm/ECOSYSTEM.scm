;; SPDX-License-Identifier: PMPL-1.0-or-later
;; ECOSYSTEM.scm - Ecosystem positioning

(ecosystem
  (version . "1.0.0")
  (name . "ephapax-playground")
  (type . "language-playground")
  (purpose . "Ephemeral application framework with linear types")

  (position-in-ecosystem
    ((parent . "language-playgrounds")
     (grandparent . "nextgen-languages")
     (category . "resource-management-languages")))

  (related-projects
    ((affinescript-playground
       ((relationship . "sibling-standard")
        (description . "Affine types - at-most-once (can drop)")))
     (mylang-playground
       ((relationship . "sibling-standard")
        (description . "Progressive type system family")))))

  (what-this-is
    ("Linear type experimentation"
     "Exactly-once resource semantics"
     "Ephemeral computation patterns"))

  (what-this-is-not
    ("Production compiler"
     "Affine types (see AffineScript)"
     "General purpose language")))
