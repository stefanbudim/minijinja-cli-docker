PHONY: clean jinja-render-docker jinja-render-binary

main: clean jinja-render-docker

jinja-render-docker:
	docker run --rm -v ".:/data" stefanbudim/minijinja-cli /data/server-template.j2 /data/server-data.yaml  > server.yaml

jinja-render-binary:
	minijinja-cli server-template.j2 server-data.yaml > server.yaml

clean:
	rm -f server.yaml
