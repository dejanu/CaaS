FROM golang:1.18 AS skopeo-build

WORKDIR /usr/src/skopeo

ARG SKOPEO_VERSION="1.8.0"
RUN curl -fsSL "https://github.com/containers/skopeo/archive/v${SKOPEO_VERSION}.tar.gz" \
  | tar -xzf - --strip-components=1

RUN CGO_ENABLED=0 DISABLE_DOCS=1 make BUILDTAGS=containers_image_openpgp GO_DYN_FLAGS=

RUN ./bin/skopeo --version


FROM scratch AS skopeo-rootfs

COPY --from=skopeo-build /usr/src/skopeo/bin/skopeo /usr/local/bin/
COPY --from=skopeo-build /usr/src/skopeo/default-policy.json /etc/containers/policy.json


FROM ubuntu:20.04

COPY --from=skopeo-rootfs / /

RUN skopeo --version