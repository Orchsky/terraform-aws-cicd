pipeline {
    agent any 
    environment {
        PATH = "${PATH}:${getTerraformPath()}"
    }
    stages {
        stage('terraform init and apply - dev'){
            steps{
                sh "terraform workspace new dev"
                sh "terraform init"
            }
        }
    }
}

def getTerraformPath() {
    def tfHome = tool name: 'terraform-13', type: 'terraform'
    return tfHome
}