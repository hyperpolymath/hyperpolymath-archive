# verisim-practice-mirror

**VeriSimDB Testing Mirror - Safe experimental copy of database structures**

## Purpose

This repository provides Cerro Torre package manifests (`.ctp` files) for testing VeriSimDB dependent types in a safe, isolated environment that mirrors production database schemas without risk of damaging live data.

## What This Is

- **VeriSimDB test environment** - Safe playground for dependent type experiments
- **Database mirror templates** - PostgreSQL, MariaDB, Dragonfly (Redis alternative)
- **Discourse forum testing** - Full Discourse stack for community platform testing
- **WordPress testing** - WordPress + OpenLiteSpeed + Varnish stack
- **Container manifests** - Cerro Torre `.ctp` files with SHA hashes for provenance

## What This Is NOT

- ❌ NOT for production use
- ❌ NOT the actual NUJ LCB website (use `nuj-lcb-production` for that)
- ❌ NOT connected to live databases (completely isolated)

## VeriSimDB

VeriSimDB is a dependently-typed database experiment. This repo lets you test database schemas and dependent type constraints without risking production data.

### Test Flow

```
Production DB (nuj-lcb-production)
    │
    │ ONE-WAY sync (read-only copy)
    ↓
VeriSimDB Test Environment (this repo)
    │
    ├─→ Test dependent types
    ├─→ Experiment with schemas
    ├─→ Break things safely
    └─→ NO write-back to production (isolated)
```

## Repository Structure

```
verisim-practice-mirror/
├── README.md                          # This file
├── LICENSE                            # PMPL-1.0-or-later
├── *.ctp                              # Cerro Torre package manifests
├── *-compose.yaml                     # Docker Compose orchestration
├── conf/                              # Configuration files
├── dist/                              # Built .ctp outputs (ignore)
└── .machine_readable/6scm/            # AI context (META, ECOSYSTEM, STATE)
```

## Cerro Torre Manifests

This repo includes `.ctp` (Cerro Torre Package) manifests for:

| Manifest | Purpose | SHA Hash Included |
|----------|---------|-------------------|
| `postgresql.ctp` | PostgreSQL 15+ database | ✅ Yes |
| `mariadb.ctp` | MariaDB 11.2 database | ✅ Yes |
| `dragonfly.ctp` | Dragonfly (Redis alternative) | ✅ Yes |
| `discourse.ctp` | Discourse forum platform | ✅ Yes |
| `wordpress-litespeed-varnish.ctp` | WordPress stack | ✅ Yes |
| `verisimdb.ctp` | VeriSimDB test instance | ✅ Yes |
| `verisimdb-connector.ctp` | DB sync orchestrator | ✅ Yes |

**Note:** SHA hashes in manifests ensure cryptographic provenance of all upstream sources.

## Quick Start

### Option 1: Test VeriSimDB with PostgreSQL

```bash
# Build VeriSimDB container (when Cerro Torre exists)
ct pack verisimdb.ctp
ct pack postgresql.ctp

# Start PostgreSQL
docker-compose -f postgresql-compose.yaml up -d

# Connect VeriSimDB test instance
# (VeriSimDB-specific connection instructions TBD)
```

### Option 2: Test Discourse Forum

```bash
# Build Discourse stack
ct pack discourse.ctp
ct pack postgresql.ctp
ct pack dragonfly.ctp

# Start full Discourse stack
docker-compose -f discourse-compose.yaml up -d

# Access at http://localhost:80
```

### Option 3: Test WordPress

```bash
# Build WordPress stack
ct pack wordpress-litespeed-varnish.ctp
ct pack mariadb.ctp

# Start WordPress
# (docker-compose file TBD)
```

## Known Issues

### Issue #1: Double Extensions in dist/

Files in `dist/` have `.ctp.ctp` double extensions. This is a bug.

**Status:** Known issue, needs fixing

### Issue #2: Absolute Paths in Compose Files

Docker Compose files contain hardcoded absolute paths:
```yaml
image: /var/mnt/eclipse/repos/branch-website/dist/discourse.ctp.ctp
```

**Status:** Needs fixing (should be relative paths)

### Issue #3: Cerro Torre Doesn't Exist Yet

The `ct pack` command above won't work because Cerro Torre is 0% complete (specs only).

**Status:** Waiting for Cerro Torre implementation

## Relationship to Other Repos

| Repo | Relationship | Notes |
|------|--------------|-------|
| `nuj-lcb-production` | Production target | ONE-WAY sync FROM here (safe) |
| `lcb-website` | Experimental sibling | Both are testbeds, different focus |
| `verisimdb` | Test subject | This repo tests that project |
| `formbd` | Future test subject | Will add FormBD testing later |

## Safety Guarantees

- ✅ **Isolated from production** - No connection to live databases
- ✅ **One-way sync only** - Can read from production, NEVER writes back
- ✅ **Safe to break** - Experiment freely without consequences
- ✅ **Independent testing** - Each test environment is self-contained

## License

PMPL-1.0-or-later (Palimpsest-MPL License 1.0 or later)

## Author

Jonathan D.A. Jewell <jonathan.jewell@open.ac.uk>

## Status

**Phase:** Early setup
**Completion:** 30%
**Production Ready:** NO (experimental only)
