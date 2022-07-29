node {
   stage('Checkout') { // for display purposes
      checkout scm
   }
   stage('Build') {
      bat 'mvn -version'
      bat 'mvn clean package -U -Dmaven.test.skip=true'
      //stash includes: 'target/*.jar', name: 'targetfiles'
      echo 'Build is completed successfully'
   }
    stage('Build Docker Image') {
      // build docker image
      //unstash 'targetfiles'
      bat "docker build -t adesurya/helloworldkube ."
      bat "docker login -u adesurya -p IkanCupang1!"
      bat "docker push adesurya/helloworldminikube:latest"
    }
   
    stage('Deploy Docker Image to minikube'){
      
      // deploy docker image to nexus

      echo "Docker Image Tag Name helloworldkube"
      bat "kubectl apply -f deployment-service.yml"
    }
   }
