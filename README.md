# momo-infrastructure



## Getting started

git clone git@gitlab.praktikum-services.ru:std-022-024/infrastructure.git


Перед началом работы с terraform получаем токен и данные облака:
```
    export YC_TOKEN=$(yc iam create-token)
    export TF_VAR_cloud_id=$(yc config get cloud-id)
    export TF_VAR_folder_id=$(yc config get folder-id)
```

## Add your files

- [ ] [Create](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#create-a-file) or [upload](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#upload-a-file) files
- [ ] [Add files using the command line](https://docs.gitlab.com/ee/gitlab-basics/add-file.html#add-a-file-using-the-command-line) or push an existing Git repository with the following command:

```
cd existing_repo
git remote add origin https://gitlab.praktikum-services.ru/std-022-024/momo-infrastructure.git
git branch -M main
git push -uf origin main
```

