run 'rm -rf app/javascript/'

run 'svn export https://github.com/Cam1no/RailsReactTemplate/trunk/javascript/ ./app/javascript/'

run 'yarn add redux react-redux redux-thunk react-router-dom redux-devtools redux-devtools-dock-monitor redux-devtools-log-monitor redux-slider-monitor'

git add: "."

git commit: %Q{ -m 'Reactの環境構築' }
