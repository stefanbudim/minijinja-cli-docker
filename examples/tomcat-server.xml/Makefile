PHONY: clean jinja-render-docker jinja-render-binary

main: clean jinja-render-docker

jinja-render-docker:
	docker run --rm -v ".:/data" stefanbudim/minijinja-cli /data/server.xml-template.j2 /data/server.xml-data.yaml  > server.xml

jinja-render-binary:
	minijinja-cli server.xml-template.j2 server.xml-data.yaml > server.xml

clean:
	rm -f server.xml.yaml
