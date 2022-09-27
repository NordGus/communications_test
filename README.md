# Comunicaciones

## El problema

Dadas las siguientes tablas:

Persona:    [id, nombre, fecha_nacimiento]

Comunicado: [id, creador_id, receptor_id, asunto, contenido, comunicado_anterior_id]

Adjuntos:   [id, comunicado_id]

Crear un mini proyecto ruby on rails que permita hacer una llamada a una API para obtener un JSON que devuelva los comunicados de las personas mayores de edad, y el número de adjuntos total de los comunicados, incluido el cero.

## Entorno de desarrollo

1. Para iniciar el entorno de desarrollo:
    ```shell
    docker compose up dev
    ```

2. Para iniciar el servidor web:
    ```shell
    docker compose exec dev rails s -b 0.0.0.0
    ```

3. Para iniciar el servidor web para debugging:
   1. ```shell
      docker compose exec dev /bin/bash
      ```
   2. ```shell
      rails s -b 0.0.0.0
      ```
