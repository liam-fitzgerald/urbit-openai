import React, { useEffect } from "react";
import { NavLink, Outlet } from "react-router-dom";
import useStore from "../state/store";


export default function ThreadList() {
  const threads = useStore((s) => s.threads);
  console.log(threads);

  useEffect(() => {
    useStore.getState().fetchThreads();
  }, []);

  return (
    <div className="flex">
      <div className="w-[300px] flex flex-col">
        <NavLink className="link" to="add">
          Add Thread
        </NavLink>
        {Object.keys(threads).map((thread) => (
          <NavLink className="link" key={thread} to={thread}>
            {threads[thread].tale.title}
          </NavLink>
        ))}
      </div>
      <div className="flex-1">
        <Outlet />
      </div>
    </div>
  );
}
