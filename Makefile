up:
	docker-compose up -d

reinit-db:
	docker-compose exec postgres psql -h postgres -U root -d postgres -f common/reinit.sql
