pipeline {
        agent any
	environment {
	  ANSIBLE_PRIVATE_KEY=credentials('ansible-private-key')
	}
	stages {
	  stage('AnsibleWorks') {
	     steps {
	     sh 'ansible-galaxy collection install -r requirements.yml -i -c'
	     sh 'ansible-playbook -i inventory --private-key=$ANSIBLE_PRIVATE_KEY playbooks/setup.yml'
	     }
	  }
	}
}
