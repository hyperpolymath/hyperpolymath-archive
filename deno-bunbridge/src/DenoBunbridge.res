// SPDX-License-Identifier: AGPL-3.0-or-later
// SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
// deno-bunbridge - Access Bun-specific APIs from Deno

let version = "0.1.0"

let isDeno = () => {
  %raw(`typeof globalThis.Deno !== "undefined"`)
}

let isBun = () => {
  %raw(`typeof globalThis.Bun !== "undefined"`)
}
