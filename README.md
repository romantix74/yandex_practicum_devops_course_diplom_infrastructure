# momo-infrastructure



## Начало работы с репозиторием

```
git clone git@gitlab.praktikum-services.ru:std-022-024/infrastructure.git
```

Перед началом работы с terraform получаем токен и данные облака:
```
    export YC_TOKEN=$(yc iam create-token)
    export TF_VAR_cloud_id=$(yc config get cloud-id)
    export TF_VAR_folder_id=$(yc config get folder-id)
```

## Публикация приложения в kubernetes

- Используя Kubernetes-манифесты:
    ```
    cd infrastructure/kubernetes/
    kubectl apply -f backend/
    kubectl apply -f frontend/
    ```
- CI/CD
