import React, { Fragment } from 'react';
import { Outlet } from 'react-router-dom';

export default function Layout() {
  return (
    <Fragment>
      <div className="px-2 sm:px-5 lg:px-24">
        <div className="flex justify-center max-w-full min-h-screen">
          <Outlet />
        </div>
      </div>
    </Fragment>
  );
}
