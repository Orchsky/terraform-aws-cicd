pipeline {
    agent any 
    environment {
        PATH = "${PATH}:${getTerraformPath()}"
    }
    stages {
        stage('terraform init and apply - dev'){
            steps{
                sh "terraform init"
                sh label: '', returnStatus: true, script: 'terraform workspace new dev'
                sh "terraform apply -auto-approve"
            }
        }
        stage('terraform init and apply - prod'){
            steps{
                sh "terraform init"
                sh label: '', returnStatus: true, script: 'terraform workspace new prod'
                sh "terraform apply -auto-approve"
            }
        }
    }
}

def getTerraformPath() {
    def tfHome = tool name: 'terraform-13', type: 'terraform'
    return tfHome
}