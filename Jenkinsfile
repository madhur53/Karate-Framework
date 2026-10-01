pipeline{
    agent any
    tools {
        jdk 'JDK 11'
    }
    
    stages {
        stage ('CleanUp Stage'){
            steps{
                //define the single or multiple step
                bat 'echo CleanUp Stage'
                cleanWs notFailBuild: true
            }
        }
        stage ('Git Checkout'){
            steps{
                //define the single or multiple step
                bat 'echo Git Checkout'
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/madhur53/Karate-Framework.git']])
                
            }
        }
        stage ('RestorePackage Stage'){
            steps{
                //define the single or multiple step
                bat 'echo RestorePackage'
            }
        }
        stage ('Build Stage'){
            steps{
                //define the single or multiple step
                bat 'echo build'  
                bat 'mvn clean compile'
                
            }
        }
        stage('Test Execution Stage'){
            steps{
                //define the single or multiple step
                bat 'echo Test Execution Started'
                bat 'java -version'
                bat 'mvn -version'
                bat 'mvn test'
                //bat 'echo Test Execution Completed'
            }
        }
    }
    post {
        always {
            // One or more steps need to be included within each condition's block.
            junit testResults: 'target/surefire-reports/*.xml', allowEmptyResults: true
            cucumber buildStatus: 'UNCHANGED', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'target/surefire-reports', pendingStepsNumber: -1, reportTitle: 'Karate Test Execution', skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
        }
    }
}