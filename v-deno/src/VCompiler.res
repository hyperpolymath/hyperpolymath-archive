// SPDX-License-Identifier: AGPL-3.0-or-later
// SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
// Optional V compilation from Deno

type compileOptions = {
  output?: string,
  shared?: bool,
  release?: bool,
  cc?: string,
}

type compileResult = {
  success: bool,
  outputPath: string,
  stdout: string,
  stderr: string,
}

let compile = async (source: string, ~options: compileOptions={}): compileResult => {
  let outputPath = Option.getOr(options.output, {
    let base = String.replaceAll(source, ".v", "")
    if Option.getOr(options.shared, false) {
      base ++ ".so"
    } else {
      base
    }
  })

  let args = [source, "-o", outputPath]
  let args = if Option.getOr(options.shared, false) {
    Array.concat(["-shared"], args)
  } else {
    args
  }
  let args = if Option.getOr(options.release, false) {
    Array.concat(["-prod"], args)
  } else {
    args
  }
  let args = switch options.cc {
  | Some(cc) => Array.concat(["-cc", cc], args)
  | None => args
  }

  let result = %raw(`
    const command = new Deno.Command("v", { args, stdout: "piped", stderr: "piped" });
    const output = await command.output();
    const decoder = new TextDecoder();
    return {
      success: output.code === 0,
      outputPath: outputPath,
      stdout: decoder.decode(output.stdout),
      stderr: decoder.decode(output.stderr),
    };
  `)

  result
}

let isVInstalled = async (): bool => {
  try {
    %raw(`
      const command = new Deno.Command("v", { args: ["version"], stdout: "piped", stderr: "piped" });
      const output = await command.output();
      return output.code === 0;
    `)
  } catch {
  | _ => false
  }
}

let vVersion = async (): option<string> => {
  try {
    Some(
      %raw(`
      const command = new Deno.Command("v", { args: ["version"], stdout: "piped", stderr: "piped" });
      const output = await command.output();
      if (output.code !== 0) return null;
      return new TextDecoder().decode(output.stdout).trim();
    `),
    )
  } catch {
  | _ => None
  }
}
