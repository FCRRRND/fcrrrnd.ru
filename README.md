# Дипломная работа

# Дипломный практикум в YandexCloud

Цели:

1. Зарегистрировать доменное имя (любое на ваш выбор в любой доменной зоне).
2. Подготовить инфраструктуру с помощью Terraform на базе облачного провайдера YandexCloud.
3. Настроить внешний Reverse Proxy на основе Nginx и LetsEncrypt.
4. Настроить кластер MySQL.
5. Установить WordPress.
6. Развернуть Gitlab CE и Gitlab Runner.
7. Настроить CI/CD для автоматического развёртывания приложения.
8. Настроить мониторинг инфраструктуры с помощью стека: Prometheus, Alert Manager и Grafana.

Решение:

1. Регистрируем домен на Reg.ru и прописываем ip адрес полученный в YandexCloud

![reg ru](https://user-images.githubusercontent.com/93032289/196037780-8218243f-41e2-4222-af4e-73064b10fb13.png)

2. Я использовал альтернативный вариант: S3 bucket в созданном YC аккаунте. Назвал его как и домен - fcrrrnd.ru    
[s3](https://github.com/FCRRRND/fcrrrnd.ru/tree/main/terraform/s3) - описание создание бакета в terraform

![bucket1](https://user-images.githubusercontent.com/93032289/196038031-7cd8b72f-0b3f-4c21-bae5-00937a84a32c.png)
![bucket](https://user-images.githubusercontent.com/93032289/196038033-c61f3ee8-c9fd-463b-9cea-430489a46ab6.png)

Настройка workspaces, сделал альтернативный вариант, один stage - [stage](https://github.com/FCRRRND/fcrrrnd.ru/tree/main/terraform/stage)    
По итогу terraform поднимает кластер и цепляет ansible роли, чтобы не приходилось каждую роль устанавливать отдельно

![stage1](https://user-images.githubusercontent.com/93032289/196038333-db12c1cb-f358-46b6-bc41-14acf8cd0d56.png)
![stage2](https://user-images.githubusercontent.com/93032289/196038334-7362ba94-82e6-451a-bbb7-609939028683.png)
![stage3](https://user-images.githubusercontent.com/93032289/196038335-60f31383-ba19-459f-8a7f-5938030dcc46.png)

По итогу получилась такая красота)

![stage4](https://user-images.githubusercontent.com/93032289/196038336-94ad1b50-8e4a-4bc5-86b0-730f2863d1b2.png)

3. Получил тестовые сертификаты через роль [certs](https://github.com/FCRRRND/fcrrrnd.ru/tree/main/ansible/roles/nginx-proxy-install)

![cert1](https://user-images.githubusercontent.com/93032289/196038668-5f6e2fb3-3920-41b8-ad96-d6881859ae8f.png)
![cert2](https://user-images.githubusercontent.com/93032289/196038669-d49d43a8-cf6d-4bfc-b453-a67c9c279f10.png)


