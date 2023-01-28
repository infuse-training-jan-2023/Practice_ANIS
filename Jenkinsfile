pipeline {
    agent any

    stages {
        stage('Build and Run Java Program') {
            steps {
                bat ''' javac DuplicateString.java
                java DuplicateString
                '''
                echo "Executes Successfully"
            }
        }
    }
}

