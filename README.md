# Terraform_IaC

Terraform is used to create an Amazon Linux Instance with a security group that allows ssh on port 22.

After the instance is up edit /etc/ansible/hosts to allow ansible to ssh into the instance.

Then, run ansible-playbook provision_ans.yml to deploy the instance with Jenkins, Java and Python.
