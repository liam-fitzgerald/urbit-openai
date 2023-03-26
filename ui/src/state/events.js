export const handleEvent =
  (urbit, factActions = {}) =>
  (evt, action) => {
    console.log('urbit event from sub: ', evt, action);
    if (evt.face === '') {
      return;
    }
    if (action === '') {
      return factActions.onInitialLoad(evt);
    }
  };
