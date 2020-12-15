pipeline {
  agent any
  stages {
    stage('pull-from-github') {
      steps {
        git(url: 'https://github.com/tarunbhartiya7/react-app', branch: 'master', poll: true)
        echo 'Pulled project from github'
      }
    }

    stage('Install yarn') {
      steps {
        sh '''curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update && sudo apt install yarn
yarn --version


'''
      }
    }

  }
}