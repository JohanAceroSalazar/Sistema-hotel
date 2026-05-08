# 🐳 Docker Compose - Sistema Hotelero con PostgreSQL y Liquibase

## 📌 Descripción
El archivo `docker-compose.yml` levanta dos servicios principales:

- **PostgreSQL**: Base de datos del sistema hotelero  
- **Liquibase**: Herramienta para gestionar y versionar la base de datos  

---

## ⚙️ Configuración del Docker Compose

```yaml
services:

  postgres:
    image: postgres:15
    container_name: sistema_hotel
    restart: always
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: sistema_hotel
      POSTGRES_DB: sistema_hotel
    ports:
      - "5436:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data

  liquibase:
    image: liquibase/liquibase
    container_name: liquibase_hotel
    depends_on:
      - postgres
    volumes:
      - ./:/liquibase/changelog
      - ./postgresql-42.7.9.jar:/liquibase/lib/postgresql.jar
    working_dir: /liquibase/changelog
    command: >
      --url=jdbc:postgresql://postgres:5432/sistema_hotel
      --username=postgres
      --password=sistema_hotel
      --driver=org.postgresql.Driver
      --changeLogFile=changelog-master.yaml
      update

volumes:
  postgres_data:
```

## Conexion

- PostgreSQL: `localhost:5436`
- Base: `sistema_hotel`
- Usuario: `postgres`
- Contraseña: `sistema_hotel`

## Arranque

Desde la raiz de este repo:

### Levantar los contenedores
```
docker compose up -d
```

### Ejecutar cambios nuevos:

```
docker compose run liquibase
```