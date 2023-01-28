pipeline {
    agent any
    stages {
        stage('Git Clone') {
            steps {
                git branch: 'jenkins-ruby-1', credentialsId: '48645ee2-e0f2-488e-8ebd-aa71da848b08', url: 'https://github.com/infuse-training-jan-2023/Practice_ANIS.git'
                echo 'Git Clone Success'
            }
        }
        stage('Build') {
            steps {
                bat 'ruby SerialAverage_UnitTest.rb'
                echo 'Build Successful'
            }
        }
        stage('Merge') {
            steps {
                bat '''
                git config --global user.email "anisofficial0208@gmail.com"
                git config --global user.name "AnisShaikh10"
                git switch jenkins-ruby
                git merge jenkins-ruby-1
                git push -u origin jenkins-ruby
                '''
                echo 'Merge Successful'
            }
        }
    }
}
