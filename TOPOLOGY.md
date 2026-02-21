<!-- SPDX-License-Identifier: PMPL-1.0-or-later -->
<!-- TOPOLOGY.md — Project architecture map and completion dashboard -->
<!-- Last updated: 2026-02-19 -->

# hyperpolymath-archive — Project Topology

## System Architecture

```
                        ┌─────────────────────────────────────────┐
                        │              ARCHIVE ACCESS             │
                        │        (Read-Only / Reference)          │
                        └───────────────────┬─────────────────────┘
                                            │
                                            ▼
                        ┌─────────────────────────────────────────┐
                        │           HYPERPOLYMATH ARCHIVE         │
                        │                                         │
                        │  ┌───────────┐  ┌───────────────────┐  │
                        │  │ Consolidated│  │  Legacy Plugins   │  │
                        │  │ Projects  │  │  (asdf, fslint)   │  │
                        │  └─────┬─────┘  └────────┬──────────┘  │
                        │        │                 │              │
                        │  ┌─────▼─────┐  ┌────────▼──────────┐  │
                        │  │ OS & Net  │  │  Zotero Tools     │  │
                        │  │ (Legacy)  │  │  (NesY, Voyant)   │  │
                        │  └─────┬─────┘  └────────┬──────────┘  │
                        └────────│─────────────────│──────────────┘
                                 │                 │
                                 ▼                 ▼
                        ┌─────────────────────────────────────────┐
                        │          FOSSILIZED DATA LAYER          │
                        │      (Commits, PRs, Historical State)   │
                        └─────────────────────────────────────────┘

                        ┌─────────────────────────────────────────┐
                        │          REPO INFRASTRUCTURE            │
                        │  .bot_directives/   .machine_readable/  │
                        │  Historical License 0-AI-MANIFEST.a2ml  │
                        └─────────────────────────────────────────┘
```

## Completion Dashboard

```
COMPONENT                          STATUS              NOTES
─────────────────────────────────  ──────────────────  ─────────────────────────────────
ARCHIVED COLLECTIONS
  asdf Plugin Archive (50+)         ██████████ 100%    Moved to reference status
  Legacy OS & Netstack              ██████████ 100%    Historical implementation stable
  Zotero / Voyant Tools             ██████████ 100%    Old API versions preserved
  AmbientOps Legacy                 ██████████ 100%    Pre-consolidation snapshots

INFRASTRUCTURE
  .machine_readable/                ██████████ 100%    Audit of archival state
  Historical Licenses               ██████████ 100%    Provenance preserved
  0-AI-MANIFEST.a2ml                ██████████ 100%    Archival entry point

─────────────────────────────────────────────────────────────────────────────
OVERALL:                            ██████████ 100%    Read-only Archival Repository
```

## Key Dependencies

```
Historical Repo ───► Consolidation ───► hyperpolymath-archive
                                              │
                                              ▼
                                       Read-only Access
```

## Update Protocol

This file is maintained primarily by AI agents for archival indexing. When updating:

1. **After archiving a new component**: Add a row in the appropriate section
2. **After structural changes**: Update the ASCII diagram
3. **Date**: Update the `Last updated` comment at the top of this file

Progress bars use: `█` (filled) and `░` (empty), 10 characters wide.
Percentages: 0%, 10%, 20%, ... 100% (in 10% increments).
