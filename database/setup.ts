import fs from 'fs';
import * as bcrypt from 'bcrypt';

const saltRounds = 10;
console.log('Starting setup.ts...');

let email: string = process.env.ADMIN_EMAIL as string;
let password: string = process.env.ADMIN_PASSWORD as string;
let pg_user: string = process.env.POSTGRES_USER as string;
let pg_password: string = process.env.POSTGRES_PASSWORD as string;

console.log(`Administrator e-mail set to: ${email}`);
console.log(`Administrator password set to: ${password}`);
console.log('Setting up database script...');

bcrypt.hash(password, saltRounds, function(__, hashed_password) {
  const content = fs.readFileSync('./database/base_setup_script.sql', {
      encoding: 'utf8',
      flag: 'r',
    }).toString()
      .replace('{{ADMIN_EMAIL}}', email)
      .replace('{{ADMIN_PASSWORD}}', hashed_password)
      .replace('{{POSTGRES_USER}}', pg_user)
      .replace('{{POSTGRES_PASSWORD}}', pg_password);

    console.log('Writing changes...');
    fs.writeFileSync(`./database/setup_script.sql`, content, { encoding: 'utf8' });
});

console.log('Setup done!');