import { useEffect, useState } from 'react';
import Urbit from '@urbit/http-api';
import { urbitConfig as config } from '../config';
import { handleEvent } from './events';
import { useStore } from './store';
import { onInitialLoad as _onInitialLoad } from './store';

const subscription = {
  app: config.agent,
  path: config.path,
  ship: window?.ship || '',
  verbose: true,
  event: console.log,
  err: console.error,
  quit: console.error,
};

export const useGptSubscription = () => {
  const [ship, urbit] = useUrbit();
  const [gptSub, setGptSub] = useState(null);
  const onInitialLoad = useStore(_onInitialLoad);
  const onUpdate = console.log;

  useEffect(() => {
    if (urbit && ship && !gptSub) {
      const gptSub = getSubscription(
        urbit,
        handleEvent(urbit, { onInitialLoad, onUpdate })
      );
      setGptSub(gptSub);
    }
    return () => {
      urbit?.unsubscribe(gptSub);
    };
  }, [ship]);
};

export const useUrbitGpt = () => {
  const [ship, urbit] = useUrbit();
  return { urbit, ship };
};

export const useUrbit = () => {
  const [urbit, setUrbit] = useState(null);
  const [ship, setShip] = useState(null);

  useEffect(() => {
    if (!ship) {
      const urbit = getUrbitApi(config.desk);
      setUrbit(urbit);
      setShip(urbit.ship);
      window.ship = urbit.ship;
      window.our = urbit.ship;
      window.desk = config.desk;
    }
  }, [ship]);
  return [ship, urbit];
};

export const getUrbitApi = (desk = config.desk) => {
  const api = new Urbit('', '', desk);
  api.ship = window.ship;
  return api;
};

export const getSubscription = (urbit, eventHandler = console.log) =>
  urbit.subscribe({
    ...subscription,
    ship: urbit.ship,
    event: eventHandler,
  });
