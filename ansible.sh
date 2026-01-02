#export ANSIBLE_HOST_KEY_CHECKING=False
component=$1

#env=$2
#ansible-playbook  -i "$component-dev.awsdevops.sbs," -e ansible_username=ec2-user -e ansible_password=DevOps321  -e role_name="$component" -e env=dev expense.yml


ansible-playbook -i "$component-$ENV.awsdevops.sbs," \
  -e ansible_user=ec2-user \
  -e ansible_password=DevOps321 \
  -e role_name="$component" \
  -e env=$ENV \
  expense.yml