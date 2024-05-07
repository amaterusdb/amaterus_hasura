# Amaterus Hasura

## 開発ガイド

### マイグレーションとメタデータを開発環境にデプロイ

```shell
sudo docker compose up -d

hasura --project "$PWD/hasura" --envfile "$PWD/.env" migrate apply --all-databases
hasura --project "$PWD/hasura" --envfile "$PWD/.env" metadata apply
```

### Webコンソールを開く

```shell
hasura --project "$PWD/hasura" --envfile "$PWD/.env" console --endpoint "http://localhost:8080"
```

`http://localhost:9695`にアクセスして、Webコンソールを開きます。

リモート環境で実行した場合、TCPポート番号`9693`と`9695`をポートフォワーディングしてください。

### バックアップ＆リストア

```shell
DUMP_SQL=$(sudo docker compose exec postgres pg_dump -U postgres --schema public --no-owner --no-acl --data-only --disable-triggers) && echo "$DUMP_SQL" > work/dump_$(date -u "+%Y-%m-%d_%H-%M-%S.%3N")Z.sql
```

```shell
cat work/dump_2023-08-05_00-00-00.000Z.sql | sudo docker compose exec -T postgres psql -U postgres --single-transaction
```

### マイグレーションとメタデータを本番環境にデプロイ

```shell
hasura --project "$PWD/hasura" --envfile "$PWD/.env.production" migrate apply --all-databases
hasura --project "$PWD/hasura" --envfile "$PWD/.env.production" metadata apply
```

### 本番環境のWebコンソールを開く

```shell
hasura --project "$PWD/hasura" --envfile "$PWD/.env.production" console
```
