start-project:
	# run project
	@echo "Grafana UI: http://localhost:3000"
	docker compose -p sentiment_recognition up -d --build

test-api:
	curl -X POST "https://localhost/predict" \
     -H "Content-Type: application/json" \
     -d '{"sentence": "Oh yeah, that was soooo cool!"}' \
	 --user admin:admin \
     --cacert ./deployments/nginx/certs/nginx.crt;

run-tests:
	./tests/run_tests.sh

stop-project:
	docker compose -p sentiment_recognition down
