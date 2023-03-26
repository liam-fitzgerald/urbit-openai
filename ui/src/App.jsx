import React from 'react';
import { createBrowserRouter, RouterProvider } from 'react-router-dom';
import { useGptSubscription } from './state/useUrbitGpt';
import Layout from './components/Layout';
import 'font-awesome/css/font-awesome.min.css';
import './index.css';

const router = createBrowserRouter(
  [
    {
      path: '/',
      element: <Layout />,
      children: [
        {
          path: ':patp',
          element: <User />,
        },
      ],
    },
  ],
  { basename: '/apps/gpt' }
);

export function App() {
  useGptSubscription();

  return (
    <React.Fragment>
      <ThemeProvider theme={theme}>
        <div className="page-container text-offwhite">
          <RouterProvider router={router} icon={false} />
        </div>
      </ThemeProvider>
    </React.Fragment>
  );
}
