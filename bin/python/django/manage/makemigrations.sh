
if [ -z "$1" ]; then
  echo 'Module name not defined'
  exit 1
fi
python3 manage.py makemigrations $1