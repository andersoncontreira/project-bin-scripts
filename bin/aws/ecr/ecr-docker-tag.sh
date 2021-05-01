if test -f .projectrc; then
  source .projectrc
elif test -f ./bin/.projectrc; then
  source ./bin/.projectrc
fi

if [ -z "$AWS_ACCOUNT_ID" ]
then
  $AWS_ACCOUNT_ID=$1
fi

if [ -z "$AWS_REGION" ]
then
  AWS_REGION="sa-east-1"
fi

if [ -z "$PROJECT_NAME" ]; then
  echo 'PROJECT_NAME not defined'
  exit 1
else
  if [ -z "$AWS_ACCOUNT_ID" ]; then
    echo 'AWS_ACCOUNT_ID not defined'
    exit 1
  else
    echo "AWS_ACCOUNT_ID: $AWS_ACCOUNT_ID"

    echo "docker tag $PROJECT_NAME:latest $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$PROJECT_NAME:latest"
    docker tag $PROJECT_NAME:latest $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$PROJECT_NAME:latest

  fi
fi