FROM oven/bun:1

LABEL author="Bruno Albuquerque"
LABEL description="Bun Runtime Enviroment"

WORKDIR /usr/src/buntime

COPY bun/app/package.json .

RUN bun install

COPY bun/app/ .

EXPOSE 8080

CMD [ "bun", "run", "app.ts" ]
 