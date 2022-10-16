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





