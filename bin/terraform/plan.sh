terraform init

if [ -z "$AWS_ACCOUNT_ID" ]
then
  $AWS_ACCOUNT_ID=$1
fi

if [ -z "$AWS_ACCOUNT_ID" ]
then
  terraform plan
else
  terraform plan -var "account_id=$1"
fi


