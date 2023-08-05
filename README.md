# Amaterus Hasura

```shell
hasura --project "$PWD/hasura" --envfile "$PWD/.env" console --endpoint "http://localhost:8080"

DUMP_SQL=$(sudo docker compose exec postgres pg_dump -U postgres --data-only --disable-triggers) && echo "$DUMP_SQL" > work/dump_$(date "+%Y-%m-%d_%H-%M-%S").sql
```
