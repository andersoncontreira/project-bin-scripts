terraform init

if [ -z "$AWS_ACCOUNT_ID" ]
then
  $AWS_ACCOUNT_ID=$1
fi

if [ -z "$AWS_ACCOUNT_ID" ]
then
  terraform plan -out $1.binary
  terraform show -json $1.binary > $1
else
  terraform plan -var "account_id=$1" -out $2.binary
  terraform show -json $2.binary > $2
fi


