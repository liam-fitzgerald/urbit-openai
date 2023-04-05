import React from "react";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import Layout from "./components/Layout";
import ChatInterface from "./components/ChatInterface";
import ThreadList from "./components/ThreadList";
import AddThread from "./components/AddThread";

import "font-awesome/css/font-awesome.min.css";
import "./index.css";

const router = createBrowserRouter(
  [
    {
      path: "/",
      element: <ThreadList />,
      children: [
        {
          path: "add",
          element: <AddThread />,
        },
        {
          path: ":id",
          element: <ChatInterface />,
        },
      ],
    },
  ],
  { basename: "/apps/gpt" }
);

export function App() {
  return (
    <React.Fragment>
      <div>
        <RouterProvider router={router} icon={false} />
      </div>
    </React.Fragment>
  );
}
