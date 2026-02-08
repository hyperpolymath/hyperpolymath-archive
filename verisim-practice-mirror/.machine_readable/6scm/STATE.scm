;; SPDX-License-Identifier: PMPL-1.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell <jonathan.jewell@open.ac.uk>
;;
;; STATE.scm — Current state of verisim-practice-mirror

(define-module (verisim-practice-mirror state)
  #:version "2026.01.28"
  #:schema-version "1.0")

;;; Metadata
(metadata
  (version "0.1.0")
  (created "2026-01-28T12:00:00Z")
  (updated "2026-01-28T12:00:00Z")
  (project "verisim-practice-mirror")
  (repo "https://github.com/hyperpolymath/verisim-practice-mirror"))

;;; Project Context
(project-context
  (name "VeriSimDB Practice Mirror")
  (tagline "Safe experimental database testing environment for VeriSimDB dependent types")
  (tech-stack
    (databases "PostgreSQL 15+, MariaDB 11.2, Dragonfly")
    (platforms "Discourse forum, WordPress")
    (build-system "Cerro Torre (when available)")
    (orchestration "Docker Compose")))

;;; Current Position
(current-position
  (phase "setup")
  (overall-completion 30)
  (production-ready #f)  ;; Experimental only
  (components
    ((name "Cerro Torre Manifests") (completion 100) (status "sha-hashes-included") (note "Files created, but CT doesn't exist yet"))
    ((name "Docker Compose Configs") (completion 70) (status "needs-path-fixes") (note "Absolute paths need fixing"))
    ((name "PostgreSQL Manifest") (completion 100) (status "ready"))
    ((name "MariaDB Manifest") (completion 100) (status "ready"))
    ((name "Dragonfly Manifest") (completion 100) (status "ready"))
    ((name "Discourse Manifest") (completion 100) (status "ready"))
    ((name "WordPress Manifest") (completion 100) (status "ready"))
    ((name "VeriSimDB Manifest") (completion 100) (status "ready"))
    ((name "RSR Compliance") (completion 0) (status "in-progress"))
    ((name "Cerro Torre Build System") (completion 0) (status "waiting") (note "CT is 0% complete"))
    ((name "VeriSimDB Integration") (completion 0) (status "pending") (note "Waiting for VeriSimDB maturity")))
  (working-features
    "CTP manifests with proper SHA hashes"
    "Docker Compose configurations"
    "Configuration files for each service")
  (blocked-features
    "Cerro Torre doesn't exist yet (0% complete)"
    "VeriSimDB integration not ready"
    "Absolute paths in compose files"
    "Double .ctp.ctp extensions in dist/"))

;;; Route to MVP
(route-to-mvp
  (milestone "M1: Repository Setup"
    (status "90% complete")
    (items
      (item "Create CTP manifests with SHA hashes" "completed" "")
      (item "Add Docker Compose configurations" "completed" "")
      (item "Add RSR compliance files" "in-progress" "")
      (item "Fix dist/ double extensions" "pending" "")
      (item "Fix absolute paths in compose files" "pending" "")))

  (milestone "M2: Local Testing (when CT exists)"
    (status "0% complete")
    (items
      (item "Build containers with Cerro Torre" "pending" "CT doesn't exist")
      (item "Test PostgreSQL locally" "pending" "")
      (item "Test MariaDB locally" "pending" "")
      (item "Test Discourse stack" "pending" "")))

  (milestone "M3: VeriSimDB Integration"
    (status "0% complete")
    (items
      (item "Connect VeriSimDB to test databases" "pending" "")
      (item "Test dependent type constraints" "pending" "")
      (item "Validate schema mirroring" "pending" "")
      (item "Document VeriSimDB test procedures" "pending" "")))

  (milestone "M4: Production Mirror (future)"
    (status "0% complete")
    (items
      (item "Set up ONE-WAY sync from nuj-lcb-production" "pending" "")
      (item "Verify no write-back possible" "pending" "")
      (item "Test with real production schemas" "pending" "")
      (item "Document safety guarantees" "pending" ""))))

;;; Blockers and Issues
(blockers-and-issues
  (critical
    ((id "BLOCK-001")
     (summary "Cerro Torre doesn't exist (0% complete)")
     (impact "Cannot build containers from CTP manifests")
     (workaround "Wait for CT implementation or use standard Docker images")
     (resolution "Monitor cerro-torre repo progress")))

  (high
    ((id "ISSUE-001")
     (summary "Double .ctp.ctp extensions in dist/")
     (impact "Files have wrong names")
     (workaround "Rename manually or fix build process")
     (resolution "Rename all dist/*.ctp.ctp to dist/*.ctp"))

    ((id "ISSUE-002")
     (summary "Absolute paths in docker-compose files")
     (impact "Only works on specific machine")
     (workaround "Edit paths manually")
     (resolution "Replace absolute with relative paths")))

  (medium
    ((id "ISSUE-003")
     (summary "No git commits yet")
     (impact "No version history")
     (workaround "None")
     (resolution "Create initial commit with RSR compliance")))

  (low ()))

;;; Critical Next Actions
(critical-next-actions
  (immediate
    "Fix dist/ double extensions (.ctp.ctp → .ctp)"
    "Fix absolute paths in compose files"
    "Create initial git commit"
    "Rename repo to verisim-practice-mirror")

  (this-week
    "Test compose files locally (without CT)"
    "Document known issues"
    "Update copyright in LICENSE")

  (this-month
    "Monitor Cerro Torre progress"
    "Test VeriSimDB when available"
    "Set up test databases locally"))

;;; Session History
(session-history
  (snapshot
    (date "2026-01-28T12:00:00Z")
    (accomplishments
      "Created comprehensive README.md"
      "Added RSR compliance files (LICENSE, SECURITY.md, etc.)"
      "Created .machine_readable/6scm/ structure"
      "Created STATE.scm, ECOSYSTEM.scm, META.scm"
      "Documented purpose as VeriSimDB test environment")))

;;; Helper Functions
(define (get-completion-percentage)
  "Overall project completion: 30%")

(define (get-blockers)
  "Current blockers: 1 critical, 2 high, 1 medium, 0 low")

(define (get-milestone milestone-name)
  (case milestone-name
    (("M1") "Repository Setup: 90% complete")
    (("M2") "Local Testing: 0% complete (blocked by CT)")
    (("M3") "VeriSimDB Integration: 0% complete")
    (("M4") "Production Mirror: 0% complete")
    (else "Unknown milestone")))
