container_name := fluentd-test
container_registry := crackmac
container_release := 0.1

.PHONY: build/image tag/image push/image

build/image:
	docker build \
		-t $(container_name) .

tag/image: build/image
	docker tag $(container_name) $(container_registry)/$(container_name):$(container_release)

push/image: tag/image
	docker push $(container_registry)/$(container_name):$(container_release)