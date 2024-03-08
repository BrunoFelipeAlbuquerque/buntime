import dotenv from 'dotenv';
import fs from 'fs';

console.log('Starting setup.ts...');
dotenv.config();

var email: string = process.env.ADMIN_EMAIL as string;
var password: string = process.env.ADMIN_PASSWORD as string;

console.log(`Administrator e-mail set to: ${email}`);
console.log(`Administrator password set to: ${password}`);
console.log('Setting up database script...');

let content = fs.readFileSync('./database/setup_script.sql', {
    encoding: 'utf8',
    flag: 'r',
  }).toString()
    .replace('{{ADMIN_EMAIL}}', email)
    .replace('{{ADMIN_PASSWORD}}', password);

console.log('Writing changes...');
fs.writeFileSync(`./database/setup_script.sql`, content, { encoding: 'utf8' });

console.log('Setup done!');