# Amaterus Hasura

```shell
hasura --project "$PWD/hasura" --envfile "$PWD/.env" console --endpoint "http://localhost:8080"

DUMP_SQL=$(sudo docker compose exec postgres pg_dump -U postgres --schema public --no-owner --no-acl --data-only --disable-triggers) && echo "$DUMP_SQL" > work/dump_$(date "+%Y-%m-%d_%H-%M-%S").sql

cat work/dump_2023-08-05_00-00-00.sql | sudo docker compose exec -T postgres psql -U postgres --single-transaction
```
