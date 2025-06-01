A CLI tool to render [Jinja2](https://jinja.palletsprojects.com/en/stable/) templates.

# Features
- single command line execution
- shell scripting
- steps in CI/CD pipelines with minimal overhead and setup
- fast template rendering as the Rust implementation is much faster than Python
- no dependencies required / no python required

# Usage

## To render a file
```bash
docker run --rm -v ".:/data" stefanbudim/minijinja-cli \
/data/service-template.j2 /data/service-data.yaml  > /etc/systemd/system/my.service
```
This will create file my.service
```bash
[Unit]
Description=My Custom Application Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/myapp --config /etc/myapp/config.yaml
Restart=on-failure
User=myappuser

[Install]
WantedBy=multi-user.target
```

Based on template and data files:

service-template.j2
```bash
[Unit]
Description={{ description }}
After=network.target

[Service]
Type=simple
ExecStart={{ exec_start }}
Restart=on-failure
User={{ user }}

[Install]
WantedBy=multi-user.target
```


service-data.j2
```bash
description: My Custom Application Service
exec_start: /usr/bin/myapp --config /etc/myapp/config.yaml
user: myappuser
```


# Credits

- [minijinja-cli](https://crates.io/crates/minijinja-cli) [github](https://github.com/mitsuhiko/minijinja/tree/main/minijinja-cli)

- [minijinja](https://docs.rs/minijinja/latest/minijinja/) [github](https://github.com/mitsuhiko/minijinja)

- [jinja](https://github.com/pallets/jinja/)

# Similar Tools
- [jinja2-cli](https://github.com/mattrobenolt/jinja2-cli)
- [jj2cli](https://github.com/m000/jj2cli)
- [jinjanator](https://github.com/kpfleming/jinjanator)
- [gomplate](https://docs.gomplate.ca/)

