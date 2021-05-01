if test -f .projectrc; then
  source .projectrc
elif test -f ./bin/.projectrc; then
  source ./bin/.projectrc
fi

if [ -z "$AWS_ACCOUNT_ID" ]
then
  $AWS_ACCOUNT_ID=$1
fi

if [ -z "$PROJECT_NAME" ]; then
  echo 'PROJECT_NAME not defined'
  exit 1
else
  if [ -z "$DOCKER_PATH" ]; then
    echo 'DOCKER_PATH not defined'
    exit 1
  fi
  docker build -t $PROJECT_NAME -f $DOCKER_PATH .
  docker network create $NETWORK_NAME
fi
