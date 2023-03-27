import { Configuration } from 'openai';

export const urbitConfig = {
  desk: 'gpt',
  path: '/gpt-chat',
  agent: 'gpt-store',
};

export const authSubConfig = {
  ship: window?.ship || process.env.REACT_APP_SHIP_NAME || '',
  url: window?.ship || process.env.REACT_APP_SHIP_URL || '',
  code: window?.ship || process.env.REACT_APP_SHIP_CODE || '',
  verbose: true,
};

export const openAiConfig = new Configuration({
  apiKey: process.env.OPENAI_API_KEY,
});
