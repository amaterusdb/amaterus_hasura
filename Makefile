include .env

.PHONY: console
console:
	@hasura console --project "./hasura" --endpoint "http://localhost:8080" --admin-secret "${HASURA_GRAPHQL_ADMIN_SECRET}"
