pipeline {
	agent any
    
    
	
    stages {
	
	    


	
	
        stage('Build du projet') { 
	        agent { docker 'maven:3.8-openjdk-18' }
            steps {
			
               sh 'mvn clean install -DskipTests ' 
				stash includes: 'target/*.jar', name: 'targetfiles'
			
				
            }
        }


  stage('login'){
        steps{
          sh 'docker login --username=machlouch --password=houssem007'
        }
  }
	stage('Construction image') {

            steps { 
               unstash 'targetfiles'
              
			   
			   script {
			  
            sh 'docker build . -t machlouch/jenkins-discovery-houssem:latest'
				
						sh 'docker push machlouch/jenkins-discovery-houssem:latest'
               
                    }
            
			   
			   
               }
            }



                stage('Deployement'){
            steps {
              withKubeCredentials(kubectlCredentials: [[caCertificate: '', clusterName: 'kubernetes', contextName: '', credentialsId: 'kubesecret', namespace: 'kube-system', serverUrl: 'https://172.31.87.91:6443']]) {
    sh 'kubectl apply -f deployment.yaml'

}
               
                }

                }





            
        }
}
