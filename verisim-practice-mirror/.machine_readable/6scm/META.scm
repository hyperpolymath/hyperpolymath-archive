;; SPDX-License-Identifier: PMPL-1.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell <jonathan.jewell@open.ac.uk>
;; META.scm - Architecture decisions for verisim-practice-mirror

(meta
  (version "1.0.0")
  (schema-version "1.0")
  (project "verisim-practice-mirror")
  (created "2026-01-28")
  (updated "2026-01-28"))

(architecture-decisions
  (adr-001
    (status "accepted")
    (date "2026-01-28")
    (context "Need safe environment to test VeriSimDB dependent types without risking production data")
    (decision "Create isolated test mirror with ONE-WAY sync from production")
    (consequences
      "Safe experimentation without production risk"
      "Can break things freely"
      "Dependent type experiments don't affect live data"
      "ONE-WAY sync prevents accidental write-back"))

  (adr-002
    (status "accepted")
    (date "2026-01-28")
    (context "Need provenance for all database container images")
    (decision "Use Cerro Torre CTP manifests with SHA hashes for all components")
    (consequences
      "Cryptographic provenance chain for all dependencies"
      "Reproducible builds (when CT exists)"
      "Blocked until Cerro Torre is implemented (currently 0%)"
      "SHA hashes ensure upstream source integrity"))

  (adr-003
    (status "accepted")
    (date "2026-01-28")
    (context "Multiple database backends needed for VeriSimDB testing")
    (decision "Support PostgreSQL, MariaDB, and Dragonfly in separate manifests")
    (consequences
      "Can test VeriSimDB against multiple DB engines"
      "Modular approach - test one DB at a time"
      "Increased manifest maintenance"
      "Flexibility for future DB additions")))

(development-practices
  (code-style
    "CTP manifest format per Cerro Torre spec"
    "Docker Compose for orchestration"
    "SHA-512/SHA-256 hashes for all upstream sources")

  (security
    "Isolated from production (no write-back)"
    "ONE-WAY sync only"
    "Secrets in .env (gitignored)"
    "No production credentials in test environment")

  (testing
    "Local Docker testing before deployment"
    "VeriSimDB dependent type validation"
    "Schema mirroring verification")

  (versioning
    "Git for version control"
    "Track CTP manifest changes"
    "Document SHA hash updates")

  (documentation
    "README.md for quick overview"
    "Inline comments in CTP manifests"
    "Known issues documented in STATE.scm"))

(design-rationale
  (why-isolated-mirror
    "VeriSimDB experiments might break schemas"
    "Production data must never be at risk"
    "Dependent type constraints need safe testing ground"
    "Isolation allows fearless experimentation")

  (why-cerro-torre
    "Need cryptographic provenance for research reproducibility"
    "Formal verification requires verified build chain"
    "SHA hashes ensure upstream source integrity"
    "Even though CT doesn't exist yet, manifests are future-ready")

  (why-multiple-databases
    "VeriSimDB should work with multiple backends"
    "PostgreSQL for advanced features"
    "MariaDB for WordPress compatibility"
    "Dragonfly for Redis alternative testing")

  (why-discourse-and-wordpress
    "Test real-world database workloads"
    "Discourse = complex forum schemas"
    "WordPress = common CMS schemas"
    "Validates VeriSimDB on actual use cases"))
