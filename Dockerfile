FROM keycloak/keycloak:21.1.1 as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_DB=mariadb
ENV KC_HOSTNAME=localhost

RUN /opt/keycloak/bin/kc.sh build

FROM keycloak/keycloak:21.1.1
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak
# ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"] //production
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "--verbose", "start-dev"]