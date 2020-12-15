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
        sh '''curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
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
      parallel {
        stage('Build project') {
          steps {
            sh '''cd /home/ubuntu/workspace/react-app_master
yarn install && yarn build'''
          }
        }

        stage('install docker') {
          steps {
            sh '''sudo apt-get update
sudo apt install docker.io -y
sudo docker --version
sudo systemctl start docker
sudo systemctl enable docker
sudo docker rm -f $(sudo docker ps -aq)


'''
          }
        }

      }
    }

    stage('deploy as webapp') {
      steps {
        sh '''sudo docker build /home/ubuntu/workspace/react-app_master -t webapp
sudo docker run -d -p 80:80 webapp'''
      }
    }

  }
}