pipeline {
    agent any 
    environment {
        PATH = "${PATH}:${getTerraformPath()}"
    }
    stages {
        stage('terraform init and apply - dev'){
            steps{
                sh "terraform init"
                sh label: '', returnStatus: true, script: 'terraform workspace select default'
                sh "terraform destroy -auto-approve"
            }
        }
    }
}


def getTerraformPath() {
    def tfHome = tool name: 'terraform-13', type: 'terraform'
    return tfHome
}