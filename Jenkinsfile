pipeline {
    agent any 
    environment {
        PATH = "${PATH}:${getTerraformPath()}"
    }
    stages {
        stage('terraform init and apply - dev'){
            steps{
                sh "terraform init"
                sh "terraform workspace new dev"
            }
        }
    }
}

def getTerraformPath() {
    def tfHome = tool name: 'terraform-13', type: 'terraform'
    return tfHome
}