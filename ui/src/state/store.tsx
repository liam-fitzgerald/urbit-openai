import { useCallback } from "react";
import produce from "immer";
import { create } from "zustand";
import Urbit from "@urbit/http-api";

export const onInitialLoad = (state) => state.onInitialLoad;

const api = new Urbit("", "");
api.ship = "fyr";
// @da
type MsgId = string;
type Role = "system" | "user" | "assistant";

interface Msg {
  parent: MsgId | null;
  role: Role;
  text: string;
}

interface StoreState {
  threads: {
    [id: string]: Msg[];
  };
  addMsg: (msg: Omit<Msg, "role">) => Promise<void>;
  fetchThreads: () => Promise<void>;
}

const useStore = create<StoreState>((set, get) => ({
  threads: {},
  fetchThreads: async () => {
    const threads = await api.scry({
      app: "legion",
      path: "/lore",
    });
    set((state) => ({ threads }));
  },
  addThread: async (id: string, { title, model }) => {
    await api.poke({
      app: "legion",
      mark: "legion-command",
      json: {
        "add-tale": {
          id,
          tale: {
            title,
            model,
          },
        },
      },
    });
    await get().fetchThreads();
  },
  addMsg: async (id, tale, text) => {
    await api.poke({
      app: "legion",
      mark: "legion-command",
      json: {
        msg: {
          id,
          tale,
          parent: null,
          text,
        },
      },
    });

    await get().fetchThreads();
  },
}));

export const useThread = (id: string) =>
  useStore(useCallback((s) => s.threads[id], [id]));

export default useStore;
