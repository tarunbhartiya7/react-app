pipeline {
  agent any
  stages {
    stage('pull-from-github') {
      steps {
        git(url: 'https://github.com/tarunbhartiya7/react-app', branch: 'master', poll: true)
        echo 'Pulled project from github'
      }
    }

  }
}