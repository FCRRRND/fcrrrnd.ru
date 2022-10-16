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

4. Создал ansible роль для установки кластера MySQL - mysql-master-node и mysql-slave-node.    
(Cluster)[https://github.com/FCRRRND/fcrrrnd.ru/tree/main/ansible/roles/mysql-config-cluster]    
(MySQL Install)[https://github.com/FCRRRND/fcrrrnd.ru/tree/main/ansible/roles/mysql-install]   

Роль для создания базы данных wordpress - [Database wordpress](https://github.com/FCRRRND/fcrrrnd.ru/tree/main/ansible/roles/create-wordpress-db)

![sql](https://user-images.githubusercontent.com/93032289/196038978-8b3b63f4-7dfe-4d0c-99e0-28f87d884527.png)

5. Роль wordpress - (wordpress)[https://github.com/FCRRRND/fcrrrnd.ru/tree/main/ansible/roles/wordpress]

![wordpress1](https://user-images.githubusercontent.com/93032289/196039163-2be99ad2-43dd-4579-b192-b6c9afbe9894.png)
![wordpress2](https://user-images.githubusercontent.com/93032289/196039164-651576db-c0f2-4dcb-903c-05eccc303983.png)

6. Роль для создания Gitlab CI - [Gitlab CI](https://github.com/FCRRRND/fcrrrnd.ru/tree/main/ansible/roles/gitlab-ce-install)    
Gitlab runner - [Gitlab runner](https://github.com/FCRRRND/fcrrrnd.ru/tree/main/ansible/roles/gitlab-runner-install)

![gitlab1](https://user-images.githubusercontent.com/93032289/196039469-868e2825-41ba-448e-a2ae-0cab061b6684.png)
![gitlab2](https://user-images.githubusercontent.com/93032289/196039470-a7dc3f54-1d02-4b4e-8903-7eb041286daf.png)

Настройка pipeline

![pipeline2](https://user-images.githubusercontent.com/93032289/196041043-20f71771-5505-4f46-bc0a-86a801ed03f6.png)
![pipeline3](https://user-images.githubusercontent.com/93032289/196041045-789d1fa0-6daf-4aef-9ff4-501a94cad45f.png)
![pipeline5](https://user-images.githubusercontent.com/93032289/196041047-31be09cb-2857-4003-8044-6201303a82d4.jpg)

7. Prometheus ansible роль - [Prometheus](https://github.com/FCRRRND/fcrrrnd.ru/tree/main/ansible/roles/prometheus-install)

![Prometheus](https://user-images.githubusercontent.com/93032289/196041224-7f36fd75-02d5-475b-a621-724dfccbe89f.png)

Alertmanager ansible роль - [Alertmanager](https://github.com/FCRRRND/fcrrrnd.ru/tree/main/ansible/roles/alertmanager-install)

![Alertmanager](https://user-images.githubusercontent.com/93032289/196041225-604b3964-d94f-4ace-b08f-2e3021f2bdac.png)

Grafana ansible роль - [Grafana](https://github.com/FCRRRND/fcrrrnd.ru/tree/main/ansible/roles/grafana-install)

![Grafana](https://user-images.githubusercontent.com/93032289/196041226-74697d93-63b7-46f5-b122-d95969bdb1d7.png)
