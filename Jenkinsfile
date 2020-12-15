pipeline {
  agent {
    node {
      label 'worker'
    }

  }
  stages {
    stage('pull-from-github') {
      steps {
        git(url: 'https://github.com/tarunbhartiya7/react-app', branch: 'master', poll: true)
        echo 'Pulled project from github'
      }
    }

    stage('Install node and yarn') {
      steps {
        sh '''curl -sL https://deb.nodesource.com/setup_13.x | sudo bash -
sudo apt-get install -y nodejs
node -v'''
        sh '''curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update && sudo apt install yarn -y
yarn --version


'''
      }
    }

    stage('Build project') {
      steps {
        sh '''cd /home/ubuntu/workspace/react-app_master
yarn install && yarn build'''
      }
    }

  }
}