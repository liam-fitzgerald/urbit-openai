const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [
    './index.html',
    './src/**/*.{js,ts,jsx,tsx}',
    'node_modules/flowbite-react/**/*.{js,jsx,ts,tsx}',
  ],
  theme: {
    extend: {
      fontFamily: {
        michroma: ['"Michroma"', ...defaultTheme.fontFamily.sans],
      },
    },
    colors: {
      primary: '#efefef',
      secondary: '#f1f1f1',
      blue: '#0284c7',
    },
  },
  screens: {},
  variants: {
    extend: {},
  },
  plugins: [require('@tailwindcss/line-clamp')],
};
