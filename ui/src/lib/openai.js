import { OpenAIApi } from 'openai';
import { openAiConfig } from '../config';

export const openaiInstance = new OpenAIApi(openAiConfig);

export const createCompletion = async (prompt) => {
  const completion = await openaiInstance.createCompletion({
    model: 'gpt-3.5-turbo',
    prompt,
  });
  return completion;
};
