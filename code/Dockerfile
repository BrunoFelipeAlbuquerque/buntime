FROM oven/bun:1

LABEL author="Bruno Albuquerque"
LABEL description="Bun Runtime Enviroment"

WORKDIR /usr/src/buntime

COPY code/app/package.json .

RUN bun install

COPY code/app/ .

EXPOSE 8080

CMD [ "bun", "--hot run", "app.ts" ]
 