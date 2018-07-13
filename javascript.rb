run 'yarn install'

run 'rm -rf app/javascript/'

run 'svn export https://github.com/Cam1no/RailsReactTemplate/trunk/javascript/ ./app/javascript/'

run 'yarn add redux react-redux redux-thunk react-router-dom redux-devtools redux-devtools-dock-monitor redux-devtools-log-monitor redux-slider-monitor'

insert_into_file 'package.json', before: '"dependencies": {' do
  <<-JSON
"scripts": {
  "dev": "NODE_ENV=development ENVIRONMENT=development ./bin/webpack-dev-server --watch --colors --progress"
},
  JSON
end

git add: '.'

git commit: %( -m 'Reactの環境構築' )
