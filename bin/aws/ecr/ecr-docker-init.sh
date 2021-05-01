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

if [ -z "$AWS_ACCOUNT_ID" ]; then
  echo 'AWS_ACCOUNT_ID not defined'
  exit 1
else
  echo "AWS_ACCOUNT_ID: $AWS_ACCOUNT_ID"
  # without profile
  if [ -z "$AWS_PROFILE" ]; then
     echo "aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com"
     aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

#    echo 'PASSWORD=$(aws ecr get-login-password --region $AWS_REGION)'
#    echo 'docker login -u AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com'

#    PASSWORD=$(aws ecr get-login-password --region $AWS_REGION)
#    docker login -u AWS -p $PASSWORD $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
#    docker login -u AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

    if [ $? -eq 0 ]; then
        echo "Login success"
    else
        echo "Login error"
        exit 1
    fi
  else
    echo "AWS_PROFILE: $AWS_PROFILE"
    echo "aws ecr get-login-password --region $AWS_REGION --profile $AWS_PROFILE | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com"
    aws ecr get-login-password --region $AWS_REGION --profile $AWS_PROFILE | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

#    echo 'PASSWORD=$(aws ecr get-login-password --region $AWS_REGION --profile $AWS_PROFILE)'
#    echo 'docker login -u AWS -p $PASSWORD $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com'

    # PASSWORD=$(aws ecr get-login-password --region $AWS_REGION --profile $AWS_PROFILE)
    # docker login -u AWS -p $PASSWORD $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
    # docker login --u AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

    if [ $? -eq 0 ]; then
        echo "Login success"
    else
        echo "Login error"
        exit 1
    fi

  fi
fi
