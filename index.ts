#! /usr/bin/env node

import { program, parse } from "commander";
import meow from "meow";

import Git from "./src/git";
import shell from "./src/libs/shell";
import { version } from "./package.json";

const cli = meow(
  `
  Usage
    $ foo <input>

  Options
    --rainbow, -r  Include a rainbow

  Examples
    $ foo unicorns --rainbow
    🌈 unicorns 🌈
`
);

const app = program.version("version");

if (cli.input[0] === "g") {
  switch (cli.input[1]) {
    case "rb":
      app
        .option("-b, --branch <branch>", "base branch", "develop")
        .option(
          "-s, --squash <count>",
          "number of commits to squash",
          Number,
          1
        )
        .option(
          "-r, --reset <count>",
          "number of commits to reset (hard)",
          Number,
          20
        );
      program.parse(process.argv);
      new Git().rebaseSquash({
        branch: program.branch,
        squash: program.squash,
        reset: program.reset,
      });
      break;

    case "co":
      app.requiredOption("-b, --branch <branch>", "base branch");
      program.parse(process.argv);
      new Git().checkout({ branch: program.branch });
      break;

    default:
      shell.echo("Not supported command.");
      shell.exit(1);
  }
}
