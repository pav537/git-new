#!groovy
pipeline{
  	environment 
	{ 
         DOCKERHUB_CREDENTIALS= credentials('dockerhub')     
    	}
  agent {label "master"}
  
    stages
      {
        stage('Docker Build') 
         {
    	      steps 
           {
      	     print("building docker image") 
             sh "sudo chmod 777 /var/run/docker.sock"
             sh "docker build /home/ubuntu/jenkins/workspace/job1/ -t pav537/custom2"
      }
    }
        stage('Login to Docker Hub') 
	{         
	 steps
		      	{                            
			sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                 
			echo 'Login Completed'                
		        }           
		} 
		
	 stage('Deploy our image') 
	   { 
            steps 
		{ 
		  sh "docker push pav537/custom2:latest"			
            	} 
            }
       

     stage('create new nodeport service')
        {
          steps {
            sh "kubectl delete -f k8s.yml"
            sh "kubectl create -f k8s.yml"\
	    sh "kubectl delete -f k8s1.yml"
            sh "kubectl create -f k8s1.yml"
            sh "kubectl get svc"
          }
        }
     stage('create ingress service')
        {
          steps {
            sh "kubectl delete -f ingress.yml"
            sh "kubectl create -f ingress.yml"
          }
        }
    }
}
