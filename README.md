# momo-infrastructure

https://momo-store-std-022-024.ru/

## Структура проекта

```
git clone git@gitlab.praktikum-services.ru:std-022-024/infrastructure.git

├── helm
│   ├── grafana
│   │   ├── dashboards
│   │   └── templates
│   ├── momo-store
│   │   └── charts
│   │       ├── backend
│   │       │   └── templates
│   │       └── frontend
│   │           └── templates
│   └── prometheus
│       ├── rules
│       └── templates
├── kubernetes
│   ├── backend
│   ├── frontend
│   ├── ingress
│   └── storage
└── terraform
    └── modules
        └── yc-k8s
```

## Публикация 

*  Деплой kubernetes через Terraform

    Перед началом работы с terraform получаем токен и данные облака:
    ```
        export YC_TOKEN=$(yc iam create-token)
        export TF_VAR_cloud_id=$(yc config get cloud-id)
        export TF_VAR_folder_id=$(yc config get folder-id)
    ```
    Далее:
    ```
    cd infrastructure/terraform/
    terraform init
    terraform plan
    terraform apply
    ```

- Публикация приложения в kubernetes


    ```
    cd infrastructure/kubernetes/
    kubectl apply -f backend/
    kubectl apply -f frontend/
    kubectl apply -f ingress/
    ```
 -  Настройка единой точки входа трафика в кластер Kubernetes
    Установка Ingress-контроллера NGINX
    ```
    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx 
    helm repo update
    helm install ingress-nginx ingress-nginx/ingress-nginx
    ```
    Узнать внешний ip-адрес ingress-контроллера (EXTERNAL-IP)
    ```
    kubectl get svc
    ```
    В сервисе Cloud DNS настроить данный ip address для записей типа А (momo-store-std-022-024.ru., grafana.momo-store-std-022-024.ru., prometheus.momo-store-std-022-024.ru.).


## Мониторинг

    Для отслеживания состояния приложения установлены Prometheus, Grafana и Loki.

- Установка Prometheuse
    ```
    cd infrastructure/helm/
    helm upgrade --install --atomic prometheus helm/prometheus
    ```

- Установка Grafana
    ```
    cd infrastructure/helm/
    helm upgrade --install --atomic grafana helm/grafana
    ```

- Установка Loki
    ```
    helm repo add grafana https://grafana.github.io/helm-charts
    helm repo update
    helm install --atomic loki grafana/loki-stack
    ```