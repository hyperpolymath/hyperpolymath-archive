;; SPDX-License-Identifier: PMPL-1.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell <jonathan.jewell@open.ac.uk>
;; ECOSYSTEM.scm - Project position in ecosystem

(ecosystem
  (version "1.0.0")
  (name "verisim-practice-mirror")
  (type "test-environment")
  (purpose "Safe isolated environment for testing VeriSimDB dependent types on real database schemas")

  (position-in-ecosystem
    "Test mirror for VeriSimDB experiments"
    "Receives ONE-WAY sync from production databases"
    "Provides safe playground for dependent type validation"
    "Uses Cerro Torre manifests for provenance (when CT exists)")

  (related-projects
    ((name "verisimdb")
     (relationship "test-subject")
     (description "This repo exists to safely test VeriSimDB dependent types"))

    ((name "nuj-lcb-production")
     (relationship "data-source")
     (description "ONE-WAY sync FROM production (read-only), NEVER writes back"))

    ((name "formbd")
     (relationship "future-test-subject")
     (description "Will add FormBD testing after VeriSimDB is stable"))

    ((name "lcb-website")
     (relationship "sibling-testbed")
     (description "Both experimental, different focus (containers vs databases)"))

    ((name "cerro-torre")
     (relationship "build-dependency")
     (description "Provides CTP build system (when it exists - currently 0%)"))

    ((name "rsr-template-repo")
     (relationship "compliance-template")
     (description "RSR structure and licensing template")))

  (what-this-is
    "VeriSimDB test environment"
    "Database schema mirror for safe experiments"
    "Cerro Torre manifest collection"
    "Isolated from production")

  (what-this-is-not
    "NOT production deployment"
    "NOT connected to live databases"
    "NOT the actual NUJ LCB website"
    "NOT a general-purpose database service"
    "NOT ready for production use (experimental only)"))
