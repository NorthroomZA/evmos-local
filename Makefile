init:
	docker-compose -f docker-compose.yaml up
	cp local.sh ./build/evmosd
	docker-compose -f docker-compose.yaml -f docker-compose.override.yaml up

start-wl:
	docker-compose -f docker-compose.yaml up
start-d:
	docker-compose -f docker-compose.yaml up -d
clean:
	docker-compose down 
	rm -rf build