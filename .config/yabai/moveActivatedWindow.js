const fs = require('fs');
const {resolve} = require('path');
const execa = require('execa');

const [, , pid] = process.argv;

(async () => {
  try {
    const {stdout: windows} = await execa.command('yabai -m query --windows');
    const app = JSON.parse(windows).filter(w => w.pid == pid);

    fs.writeFileSync(
      resolve(__dirname, 'output.txt'),
      JSON.stringify({success: true, pid, app}, undefined, 1)
    );
  } catch (e) {
    fs.writeFileSync(
      resolve(__dirname, 'output.txt'),
      JSON.stringify(e.toString(), undefined, 2)
    );
  }
})();
