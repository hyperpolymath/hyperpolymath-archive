;; ECOSYSTEM.scm - Ecosystem Position
;; SPDX-License-Identifier: PMPL-1.0-or-later

(ecosystem
  (metadata
    (version "0.1.0")
    (last-updated "2026-02-08"))
  (project
    (name "hyperpolymath-archive")
    (purpose "Archived repos preserved from consolidation")
    (role archive))
  (position-in-ecosystem
    (category "hyperpolymath-tools")
    (layer "infrastructure"))
  (related-projects
    (project (name "rsr-template-repo") (relationship "template-source"))))
