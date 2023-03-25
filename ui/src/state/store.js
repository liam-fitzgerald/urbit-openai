import produce from 'immer';
import { createStore } from './middleware';

export const onInitialLoad = (state) => state.onInitialLoad;

export const useStore = createStore((set, get) => ({
  selectedItem: { name: '', type: '', key: '' },
  selectedSection: 'all',
  alertIsOpen: false,
  alertText: '',
  onInitialLoad: (initialState) => {
    get().setInitialState(initialState);
    get().indexAll(initialState);
  },
  setInitialState: (state) =>
    set(
      produce((draft) => {
        draft.initialState = state;
      })
    ),
  setAlertIsOpen: (isOpen) =>
    set(
      produce((draft) => {
        draft.alertIsOpen = isOpen;
      })
    ),
  setAlertText: (text) =>
    set(
      produce((draft) => {
        draft.alertText = text;
      })
    ),
}));
