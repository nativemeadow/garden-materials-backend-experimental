const bcrytp = require('bcryptjs');
const prompt = require('prompt');

prompt.start();

prompt.get(['password'],
    async function processPassword(err, result) {
        if (err) {
            return onErr(err);
        }
        console.log('Command-line input received:');
        console.log('  Password: ' + result.password);

        const encrypted = await bcrytp.hash(result.password, 12);

        console.log('  Encrypted password: ' + encrypted);


        const isValidPassword = await bcrytp.compare(result.password, encrypted);

        console.log(`Password matched encrypted ${isValidPassword}`);

    });

function onErr(err) {
    console.log(err);
    return 1;
}