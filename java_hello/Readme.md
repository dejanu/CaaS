# Start app:
```bash
mvn spring-boot:run
```

# Build&Push image to gcr.io:
```bash
docker build -t dejanualex/java_hello:1.0 . --no-cache
docker run --rm  -p 8080:8080 dejanualex/java_hello:1.0
```
# Links

* Maven project [generator](https://start.microprofile.io/)
* Spring project [init](https://start.spring.io/): Dependencies and select Spring Web.