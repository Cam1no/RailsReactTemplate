const path = require('path');

module.exports = {
  env: {
    browser: true,
    node: true,
    mocha: true,
  },
  parser: 'babel-eslint',
  extends: [
    'airbnb/base',
    'plugin:import/errors',
    'eslint:recommended',
    'plugin:react/recommended',
  ],
  rules: {
    'arrow-body-style': 0,
    'brace-style': [
      'error',
      '1tbs',
      {
        allowSingleLine: true,
      },
    ],
    'dot-notation': 0,
    'keyword-spacing': ['error', { after: true }],
    'no-console': 0,
    'no-underscore-dangle': 'off',
    'no-use-before-define': 0,
    'object-curly-newline': [
      'error',
      {
        multiline: true,
        minProperties: 4,
      },
    ],
    'object-curly-spacing': [
      'error',
      'always',
      {
        objectsInObjects: false,
      },
    ],
    'object-property-newline': [
      'error',
      {
        allowMultiplePropertiesPerLine: false,
      },
    ],
    'prefer-destructuring': [
      'error',
      {
        array: false,
        object: true,
      },
      {
        enforceForRenamedProperties: false,
      },
    ],
    semi: ['error', 'always'],
    radix: ['error', 'as-needed'],
    'comma-dangle': ['error', 'always-multiline'],
    'arrow-parens': 'off',
    'generator-star-spacing': 'off',
    'import/extensions': 'off',
    indent: ['error', 2, { SwitchCase: 1, MemberExpression: 1 }],
    'import/no-extraneous-dependencies': 'off',
    'import/prefer-default-export': 'off',
    quotes: ['error', 'single', { allowTemplateLiterals: true }],
    'react/forbid-prop-types': 'off',
    'react/jsx-filename-extension': 'off',
    'react/no-danger': 'off',
    'react/no-unused-prop-types': 'off',
    'react/prefer-stateless-function': 'off',
    'react/prop-types': 1,
  },
  settings: {
    'import/resolver': {
      webpack: {
        config: {
          resolve: {
            extensions: ['.js', '.jsx', '.json'],
            modules: [
              path.resolve(__dirname, 'app/javascript/src/app/lib'),
              path.resolve(__dirname, 'node_modules'),
              path.resolve(__dirname, 'app/assets'),
            ],
          },
        },
      },
    },
  },
  globals: {
    window: true,
    document: true,
  },
  plugins: ['react', 'class-property'],
};
