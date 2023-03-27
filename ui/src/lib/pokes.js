import reduce from 'lodash/reduce';

export const createPoke = (urbit, type) => async (data) => {
  const poke = buildPoke(type, data);
  try {
    const res = await urbit.poke(poke);
    console.log('Poke Response: ', res);
    return res;
  } catch (err) {
    console.error(err);
  }
};

export const buildPoke = (type, data) => ({
  app: 'gpt',
  mark: 'legion-command',
  json: {
    prompt: {
      id: 'current-date-in-ms',
      parent: "'id' of parent, else null",
      role: 'user',
      text: 'text of user prompt',
    },
    // [type.POKE_KEY]: structurePokeData(type.FIELDS, data),
  },
  onSucccess: console.log,
  onError: console.error,
});

export const structurePokeData = (fields, data) =>
  reduce(
    fields,
    (acc, val) => {
      acc[val.name] = data[val.name];
      return acc;
    },
    {}
  );
