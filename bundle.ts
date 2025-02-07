import * as esbuild from "npm:esbuild@0.20.2";
import { denoPlugins } from "jsr:@luca/esbuild-deno-loader@^0.11.1";
import * as path from "@std/path";

const projectRoot = import.meta.dirname ?? ".";

Deno.mkdir(path.join(projectRoot, "dist"), { recursive: true });

await esbuild.build({
  plugins: [...denoPlugins()],
  entryPoints: [path.join(projectRoot, "src/whichlang.ts")],
  outdir: path.join(projectRoot, "dist"),
  bundle: true,
  format: "esm",
});

esbuild.stop();

Deno.symlink(
  path.join(projectRoot, "src/whichlang.css"),
  path.join(projectRoot, "dist/whichlang.css"),
).catch((error) => {
  if (error.code !== "EEXIST") {
    console.error(error);
  }
});
