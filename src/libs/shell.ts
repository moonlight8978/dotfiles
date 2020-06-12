import sh from "shelljs";

export default {
  ...sh,
  exec: (command: string): string => {
    const result = sh.exec(command, { silent: true });

    if (result.code !== 0) {
      throw new Error(result.stderr);
    }

    return result;
  },
  checkPrerequisite: (command: string): boolean => {
    const result = sh.which(command);

    if (!result) {
      throw new Error(`This feature requires ${command} to be installed.`);
    }

    return true;
  },
};
