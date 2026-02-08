;; META.scm - Meta Information
;; SPDX-License-Identifier: PMPL-1.0-or-later

(meta
  (metadata
    (version "0.1.0")
    (last-updated "2026-02-08"))
  (project-info
    (type monorepo)
    (languages (mixed))
    (license "PMPL-1.0-or-later"))
  (architecture-decisions
    (adr (id "ADR-001") (title "Monorepo consolidation") (status accepted)
      (context "Consolidate related repos to reduce maintenance burden")
      (decision "Group related tools into single monorepo")))
  (development-practices
    (practice "RSR compliance" status enforced)
    (practice "CI/CD workflows" status active)))
