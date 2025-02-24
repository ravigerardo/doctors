# ASISTENCIA CLINICA

[![Maintainability](https://api.codeclimate.com/v1/badges/09e3708ac24f9016f6fd/maintainability)](https://codeclimate.com/github/JuanVqz/doctors/maintainability)
[![current rails build](https://github.com/JuanVqz/doctors/actions/workflows/current-rails-app.yml/badge.svg)](https://github.com/JuanVqz/doctors/actions/workflows/current-rails-app.yml)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

Es un sistema donde las instituciones clinicas podran registrar doctores para
tomar consultas de los pacientes y conservar el historial clinico.

## Requisitos

- ruby 2.7.5
- rails 7.0.3.1
- postgres 13

## Instalación

Es necesario utilizar `lvh.me:300` para ingresar a los subdominio desde el ambiente
de desarrollo, si ejecuta las semillas existe un subdominio `demo`
y debes ingresar de la siguiente manera.

```sh
git clone https://JuanVqz@bitbucket.org/JuanVqz/doctors.git
cd doctors

# con docker
docker-compose run --rm web rails db:setup
docker-compose up

# ó local
./bin/setup
./bin/dev
```

ahora puedes visitar la siguiente ruta

```bash
http://demo.lvh.me:3000
```

e iniciar sesión con el doctor (administrador)

```
usuario: cero@gmail.com
contraseña: 123456
```

## Build next rails config

```
docker-compose build --build-arg BUNDLE_GEMFILE=Gemfile.next next
docker-compose up next
docker-compose run --rm next bash
```

## Importar información (opcional)

Los Doctores que utilizan nuestro servicio habian usado un sistema llamado Bento.

Este sistema solo tenia soporte para Mac pero no lo han actualizado por lo tanto
los Doctores buscaron una alternativa web pero requieren el historial clinico de sus pacientes.

1. Exportar desde Bento

- El template de los pacientes
- El template de las consultas medicas

2. Crear un namespace con el nombre del doctor en la tarea import.rake

```
  namespace :import do
    namespace :doctor_name do
      task patients do
      end
      task medical_consultations do
      end
    end
  end
```

Ejecutar importación:

```ruby
rake import:doctor_name:patients
rake import:doctor_name:medical_consultation
```

## Deploy

### Reiniciar base de datos | Warning: Perderá toda la información

```bash
heroku restart; heroku pg:reset DATABASE --confirm heroku_doctors;
heroku run rails db:migrate
heroku run rails db:seed
heroku run rails console
```

#### Deploy (deprecado)

Antes de realizar el deploy puedes verificar los requisitos con:

```sh
cap production deploy:check
```

Comandos para realizar deploy con capistrano:

```sh
cap production deploy
```

Despues de realizar el deploy, tienes que reiniciar unicorn con el comando siguiente:

```sh
cap production unicorn:start
```

## Desarrollo

Si esta interesado en contribuir al desarrollo comprando un subdominio
puede [contactarnos.](https://github.com/JuanVqz)
