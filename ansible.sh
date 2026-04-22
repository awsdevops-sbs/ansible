#export ANSIBLE_HOST_KEY_CHECKING=False
component=$1

/usr/bin/python3.13 -m pip install --user hvac

# 2. Add the user-space site-packages to PYTHONPATH so Ansible can find them
export PYTHONPATH="${HOME}/.local/lib/python3.13/site-packages:${PYTHONPATH}"

#env=$2
#ansible-playbook  -i "$component-dev.awsdevops16297.sbs," -e ansible_username=ec2-user -e ansible_password=DevOps321  -e role_name="$component" -e env=dev expense.yml


#ansible-playbook -i "$component-$env.awsdevops16297.sbs," \
#  -e ansible_user=ec2-user \
#  -e ansible_password=DevOps321 \
#  -e role_name="$component" \
#  -e env=$env \
#  -e mysql_password=ExpenseApp@1 \
#  expense.yml


export ANSIBLE_PYTHON_INTERPRETER=/usr/bin/python3.9
rm -f ~/*.json

ansible-playbook get-secrets.yml  \
-e role_name="$component" \
  -e env=$env \
  -e vault_token=$vault_token


  #ansible-playbook -i $component-$env.awsdevops16297.sbs,  -e env=$env -e role_name=$component expense.yml -e '@~/secret.json' -e '@~/app.json' -e '@~/newrelic_key.json'

aws ec2 describe-instances --filters "Name=tag:Name,Values=$component-$env" Name=instance-state-name,Values=running --query "Reservations[*].Instances[*].PrivateIpAddress" --output text >inv

ansible-playbook -i inv  -e env=$env -e role_name=$component expense.yml -e '@~/secrets.json'

rm -f ~/*.json

#aws ec2 describe-instances --filters Name=tag:Name,Values=$component-$env Name=instance-state-name,Values=running --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text >inv
#ansible-playbook -i inv -e env=$env -e role_name=$component expense.yml -e '@~/secrets.json'



#ansible-playbook -i "$component-$env.awsdevops16297.sbs," \
#  -e role_name="$component" \
#  -e env=$env \
#   expense.yml  \
#   -e vault_token=$vault_token \
#   -e '@~/secret.json'  \
#   -e '@~/app.json'








   #ansible-playbook get-secrets.yml -e vault_token=$vault_token -e env=$env -e role_name=$component






