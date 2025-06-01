PHONY: clean jinja-render-docker jinja-render-binary

main: clean jinja-render-docker

jinja-render-docker:
	docker run --rm -v ".:/data" stefanbudim/minijinja-cli /data/nginx-template.j2 /data/nginx-data.json  > nginx.conf

jinja-render-binary:
	minijinja-cli nginx-template.j2 nginx-data.json > nginx.conf

clean:
	rm -f nginx.conf
