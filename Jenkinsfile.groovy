@Library('pipeline-library-demo')_
pipeline {
    agent { label 'slave1' }

   stages {
      stage('Build') {
         steps {
            // Get some code from a GitHub repository
            git 'https://github.com/dudi938/AnyVision.git'
            sh label: '', script: 'docker ps -a'
         }

         post {
            // If Maven was able to run the tests, even if some of the test
            // failed, record the test results and archive the jar file.
            success {
                echo 'Hi dev'
                sayHello 'Dave'
                dockerAPI
            }
         }
      }
   }
}
