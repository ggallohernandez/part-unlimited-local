# Parts Unlimited

Welcome! This is a demo project designed for QVentus. This app is built using Docker Compose, and runs on Django, Postgres, and Nginx. 

To get started with this demo, follow the installation instructions in the next section. I hope you find it of interest!


## Installation
To install this project, follow these steps:

1. Clone the repository for the Local Environment:
```
$ git clone https://github.com/ggallohernandez/part-unlimited-local.git

```

2. Clone the repository for the Parts API

```
$ git clone https://github.com/ggallohernandez/part-unlimited-api.git

```

3. Build the project

```
$ cd parts-unlimited-local/

$ make all
```

Now it's ready to go

## Quickstart

* Browsable API: http://localhost/api/
* Swagger UI: http://localhost/docs
* OpenAPI Schema: http://localhost/api/openapi.json

Obtain an authentication token with the given credentials

`Username: user`
`Password: 1234` 

```
curl -X 'POST' \
  'http://localhost/api/authenticate/' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "username": "user",
  "password": "1234"
}'
```

And then use it to authenticate within the API

```
curl -X 'GET' \
  'http://localhost/api/topwords/?n=5' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer cc8e5e4ea3fe30d733bea71d07a739c2809b96b1'
```

