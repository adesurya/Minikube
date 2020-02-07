node {
   stage('Checkout') { // for display purposes
      checkout scm
   }
   stage('Build') {
      sh 'mvn -version'
      sh 'mvn clean package -U -Dmaven.test.skip=true'
      stash includes: 'target/*.jar', name: 'targetfiles'
      echo 'Build is completed successfully'
   }
    stage('Build Docker Image') {
      // build docker image
      unstash 'targetfiles'
      sh "docker build -t helloworldkube ."
    }
   
    stage('Deploy Docker Image to minikube'){
      
      // deploy docker image to nexus

      echo "Docker Image Tag Name helloworldkube"
      sh "kubectl apply -f deployment-service.yml"
    }
   }
