#!groovy
pipeline{
  agent {label "master"}
  
    stages
      {
        stage('Docker Build') 
         {
    	      steps 
           {
      	     print("building docker image") 
             sh "sudo chmod 777 /var/run/docker.sock"
             sh "docker build /home/ubuntu/jenkins/workspace/job1/ -t pav537/custom"
      }
    }

     stage('create new nodeport service')
        {
          steps {
            sh "kubectl create -f k8s.yml"
          }
        }

    }
}
