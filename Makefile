
docker:
	@docker build -t boscolai/m3ufilter:latest .

push:
	@docker push boscolai/m3ufilter:latest
