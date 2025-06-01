PHONY: clean jinja-render-docker jinja-render-binary

main: clean jinja-render-docker

jinja-render-docker:
	docker run --rm -v ".:/data" stefanbudim/minijinja-cli /data/Deployment-template.j2 /data/Deployment-data.yaml  > Deployment.yaml

jinja-render-binary:
	minijinja-cli Deployment-template.j2 Deployment-data.yaml > Deployment.yaml

clean:
	rm -f Deployment.yaml
