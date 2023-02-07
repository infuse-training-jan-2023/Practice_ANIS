pipeline {
    agent any

    stages {
        stage('Build and Run Ruby Unit Test') {
            steps {
                bat ''' ruby Array_Operation_UnitTest.rb
                '''
                echo "Unit Test Executed Successfully"
            }
        }
    }
}
