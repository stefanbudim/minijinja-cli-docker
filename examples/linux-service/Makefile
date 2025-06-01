PHONY: clean jinja-render-docker jinja-render-binary

main: clean jinja-render-docker

jinja-render-docker:
	docker run --rm -v ".:/data" stefanbudim/minijinja-cli /data/service-template.j2 /data/service-data.yaml  > my.service

jinja-render-binary:
	minijinja-cli service-template.j2 service-data.yaml > my.service

clean:
	rm -f my.service
