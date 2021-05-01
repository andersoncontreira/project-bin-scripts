terraform init

if [ -z "$AWS_ACCOUNT_ID" ]
then
  $AWS_ACCOUNT_ID=$1
fi

if [ -z "$AWS_ACCOUNT_ID" ]
then
  #terraform plan
  terraform apply -auto-approve
else
  #terraform plan -var "account_id=$1"
  terraform apply -auto-approve -var "account_id=$AWS_ACCOUNT_ID"
fi

