FROM klakegg/hugo:ext AS builder

COPY . /src
WORKDIR /src

ENV HUGO_BASEURL="http://localhost:8080"

RUN hugo #--minify
RUN ls

FROM nginx

COPY --from=builder /src/public /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

