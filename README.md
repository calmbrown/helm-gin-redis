# helm-gin-redis

## 기술 스택
- Helm
- Kubernetes ( AWS EKS )
- Terraform
- Golang
- Gin framework
- Redis

## 내용
- Terraform 으로 AWS에 EKS 인프라 구축
- Helm 으로 EKS 리소스 배포 ( pod, ingress, service, hpa 등 구현 )
  - AWS 의 Route53, NLB, ACM 연계
- Gin 프레임워크를 활용해 Go언어로 아래 WEB 개발 ( 스토리지 - Redis )
  
  <img width="356" alt="image" src="https://user-images.githubusercontent.com/43468563/172343206-d961cfef-49c6-4442-b0cf-e819b7a7b643.png">


## HPA(Horizontal Pod Autoscaler) 시현 영상

https://user-images.githubusercontent.com/43468563/172282846-2289df36-9392-4b91-a7bf-ba99e19cd1d3.mp4




  
  
 ## helm-gin-redis 리포지토리 구성

```bash
.  
├── Dockerfile # 베이스 도커파일  
├── README.md  
├── deploy.sh # 위 Dockerfile 빌드,배포 스크립트 # 웹 어플리케이션을 구현한 차트이며, Redis 를 서브 차트로 갖고있다
├── gin-web
│   ├── README.md  
│   ├── db  
│   ├── go.mod  
│   ├── go.sum  
│   ├── main.go  
│   └── templates  
├── go-k8s # Helm Chart, 웹 어플리케이션을 구현한 차트이며 Redis 를 서브 차트로 갖고있다 ( 서브차트 경로 : ./charts/redis-16.10.1 )  
│   ├── Chart.lock  
│   ├── Chart.yaml  
│   ├── charts  
│   ├── templates  
│   └── values.yaml  
└── terraform-eks  
    ├── eks-cluster.tf  
    ├── eks-worker-nodes.tf  
    ├── outputs.tf  
    ├── providers.tf  
    ├── variables.tf  
    ├── vpc.tf  
    └── workstation-external-ip.tf
```
