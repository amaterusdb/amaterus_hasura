# Amaterus Hasura

## 開発ガイド

### Webコンソールを開く

```shell
hasura --project "$PWD/hasura" --envfile "$PWD/.env" console --endpoint "http://localhost:8080"
```

### バックアップ＆リストア

```shell
DUMP_SQL=$(sudo docker compose exec postgres pg_dump -U postgres --schema public --no-owner --no-acl --data-only --disable-triggers) && echo "$DUMP_SQL" > work/dump_$(date -u "+%Y-%m-%d_%H-%M-%S.%3N")Z.sql
```

```shell
cat work/dump_2023-08-05_00-00-00.000Z.sql | sudo docker compose exec -T postgres psql -U postgres --single-transaction
```

### マイグレーションとメタデータを本番環境にデプロイ

```shell
hasura --project "$PWD/hasura" --envfile "$PWD/.env.production" metadata apply
hasura --project "$PWD/hasura" --envfile "$PWD/.env.production" migrate apply --all-databases
```

### 本番環境のWebコンソールを開く

```shell
hasura --project "$PWD/hasura" --envfile "$PWD/.env.production" console
```
