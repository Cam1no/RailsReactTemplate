run 'yarn add babel-eslint eslint eslint-plugin-class-property'
run 'yarn add eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react --dev'

run 'svn export https://github.com/Cam1no/faster/trunk/files/eslintrc.js ./.eslint.js'

git add: '.'

git commit: %( -m 'eslintの設定' )
