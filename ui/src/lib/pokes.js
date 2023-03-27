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
  app: 'legion',
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

// a %watch
export const watchPrompts = {
  app: 'legion',
  path: '/prompts',
};
// returns events of type
// { "add": {
//   id: <id-as-@da>,
//   prompt: {
//     parent: <parent-as-@da, or null>
//     role: 'user' | 'assistant' | 'system'
//     text: 'text of prompt or response
//   }
//
//
//  a %scry
export const scryPrompts = (id) => ({
  app: 'legion',
  path: `/ancestry/${id}`
});
/// returns history of prompt as {
//   [id-as-@da]: {
//     parent: <parent-as-@da, or null>
//     role: 'user' | 'assistant' | 'system'
//     text: 'text of prompt or response
//   }

export const structurePokeData = (fields, data) =>
  reduce(
    fields,
    (acc, val) => {
      acc[val.name] = data[val.name];
      return acc;
    },
    {}
  );
