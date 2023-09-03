const crypto = require('crypto');

export default function generateRandomString(length: number): string {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  const randomBytes = crypto.randomBytes(length);
  let result = '';

  for (let i = 0; i < length; i++) {
    const index = randomBytes[i] % characters.length;
    result += characters.charAt(index);
  }

  return result;
}
