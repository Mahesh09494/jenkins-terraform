pipeline{
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('ACCESS_KEY')
        AWS_SECRET_ACCESS_KEY = credentials('SECERT_KEY')
        a="${params.choice}"
        destroy="${params.cmd}"
    }
    tools{
        terraform 'Terraform'
        git 'Default'
    }
    parameters {
        booleanParam 'choice'
        string name: 'cmd', trim: true
    }

    stages{
        stage('checkout'){
            steps{
                git url:'https://github.com/Mahesh09494/jenkins-terraform.git', branch: "main"
            }
        }
        stage('init'){
            steps{
                sh "terraform init"
            }
        }
        stage('plan'){
            steps{
                echo "${a}"
                sh "terraform plan -var env=$env.a -out=tfplan"
            }
        }
        stage('apply'){
            when{
                expression { "$env.destroy" != 'destroy' }
            }
            steps{
                sh 'terraform apply tfplan'
            }
        }
        stage('destroy'){
            when {
                    expression { "$env.destroy" == 'destroy' }
            }
            steps{
                sh "terraform $env.destroy -var env=$env.a -auto-approve"
            }
        }
    }
}
