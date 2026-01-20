#export ANSIBLE_HOST_KEY_CHECKING=False
component=$1

#env=$2
#ansible-playbook  -i "$component-dev.awsdevops.sbs," -e ansible_username=ec2-user -e ansible_password=DevOps321  -e role_name="$component" -e env=dev expense.yml


#ansible-playbook -i "$component-$env.awsdevops.sbs," \
#  -e ansible_user=ec2-user \
#  -e ansible_password=DevOps321 \
#  -e role_name="$component" \
#  -e env=$env \
#  -e mysql_password=ExpenseApp@1 \
#  expense.yml


ansible-playbook get-secrets.yml  \
-e role_name="$component" \
  -e env=$env \
  -e vault_token=$vault_token

ansible-playbook -i "$component-$env.awsdevops.sbs," \
  -e role_name="$component" \
  -e env=$env \
  -e mysql_password=ExpenseApp@1 \
  expense.yml  \
   -e '@secret.json'