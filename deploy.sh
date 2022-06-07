TAG=$1
echo $TAG
aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin {AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com
docker build -t testgo .
docker tag testgo:latest {AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com/testgo:$TAG
docker push {AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com/testgo:$TAG

gsed -i "/appVersion/ c\appVersion: \"$TAG\"" go-k8s/Chart.yaml
helm upgrade go-k8s go-k8s
