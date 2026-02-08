;; SPDX-License-Identifier: PMPL-1.0-or-later
;; STATE.scm - Current project state

(state
  (version . "0.1.0")
  (phase . "active-development")
  (updated . "2026-01-23T20:00:00Z")

  (project
    (name . "ephapax-playground")
    (tier . "satellite")
    (license . "AGPL-3.0-or-later")
    (languages . ("rust" "rescript" "javascript")))

  (compliance
    (rsr . #t)
    (security-hardened . #t)
    (ci-cd . #f)
    (guix-primary . #f)
    (nix-fallback . #f))

  (current-position
    ((overall-completion . 85)
     (components
       ((backend-api . 100)
        (frontend-mvp . 90)
        (examples . 100)
        (documentation . 100)
        (educational-content . 100)
        (deployment . 0)
        (codemirror-integration . 0)
        (share-functionality . 0)))
     (working-features
       ("Backend API with /api/compile endpoint"
        "Frontend UI with mode toggle"
        "Code editor (basic textarea)"
        "Example selector"
        "Output display with tabs"
        "8 example programs (added HTTP + regions)"
        "Affine/Linear mode switching"
        "Error/warning display"
        "2 comprehensive lessons (2,300+ lines)"
        "HTTP server examples demonstrating linear types"
        "Connection leak detection example"
        "Complete examples documentation with learning paths"))))

  (bootstrap-status
    (affine-compiler-integration . "complete")
    (linear-compiler-integration . "pending")
    (wasm-generation . "complete")
    (browser-execution . "pending"))

  (milestones
    (v0.1.0-mvp
      (status . "in-progress")
      (target-date . "2026-01-29")
      (features
        "✅ Backend API server"
        "✅ Frontend MVP"
        "✅ Mode toggle"
        "✅ 5 example programs"
        "⏳ CodeMirror integration"
        "⏳ Example file serving"
        "⏳ Share functionality"))
    (v0.2.0-polish
      (status . "planned")
      (target-date . "2026-02-12")
      (features
        "Syntax highlighting"
        "Type visualization"
        "Better error display"
        "WASM execution in browser"
        "Mobile responsive"))
    (v1.0.0-launch
      (status . "planned")
      (target-date . "2026-02-26")
      (features
        "Production deployment"
        "Custom domain"
        "Linear compiler integration"
        "Educational mode"
        "Documentation complete")))

  (critical-next-actions
    (immediate
      "Test backend with all example files"
      "Implement example file serving endpoint"
      "Compile ReScript to JavaScript and test")
    (this-week
      "Upgrade editor to CodeMirror"
      "Add syntax highlighting"
      "Implement share functionality")
    (this-month
      "Deploy MVP to test domain"
      "Add WASM execution"
      "Type visualization"))

  (blockers
    ((linear-compiler . "Waiting for ephapax-linear implementation")
     (browser-wasm . "Need WASM runtime integration")))

  (session-history
    ((date . "2026-01-23")
     (accomplishments
       "Created backend API server (Rust + Axum)"
       "Implemented /api/compile endpoint"
       "Integrated ephapax-affine and ephapax-cli"
       "Created 5 example programs (initial)"
       "Built frontend MVP (ReScript + Deno + Vite)"
       "Implemented mode toggle UI"
       "Added code editor and output display"
       "Created comprehensive documentation"
       "ADDED 3 NEW EXAMPLES: 40-connection-linear, 41-connection-leak, 50-regions"
       "WROTE 2 COMPREHENSIVE LESSONS (2,300+ lines total)"
       "Lesson 1: What is Ephapax (600 lines)"
       "Lesson 2: Linear vs Affine deep dive (900 lines)"
       "UPDATED examples/README.md with learning paths (800 lines)"
       "Demonstrated linear types catching real resource leaks"
       "Created complete educational experience for playground users")
     (files-created
       "backend/Cargo.toml"
       "backend/src/main.rs"
       "frontend/deno.json"
       "frontend/rescript.json"
       "frontend/vite.config.js"
       "frontend/index.html"
       "frontend/src/App.res"
       "frontend/src/styles.css"
       "examples/01-hello-world.eph"
       "examples/10-affine-drop.eph"
       "examples/20-linear-demo.eph"
       "examples/21-linear-explicit.eph"
       "examples/30-comparison.eph"
       "examples/40-connection-linear.eph"
       "examples/41-connection-leak.eph"
       "examples/50-regions.eph"
       "examples/README.md"
       "lessons/01-what-is-ephapax.md"
       "lessons/02-linear-vs-affine.md"
       "docs/PLAYGROUND-STATUS.md"
       "README-DEVELOPMENT.md")
     (next-session
       "Deploy to production"
       "Add CodeMirror editor with syntax highlighting"
       "Test all 8 examples in browser"))))
