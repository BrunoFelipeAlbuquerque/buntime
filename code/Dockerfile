FROM oven/bun:1 as base

LABEL author="Bruno Albuquerque"
LABEL description="Postgresql Database"

WORKDIR /usr/src/app

ENV NODE_ENV=dev

RUN bun add express

FROM base AS install
RUN mkdir -p /temp/dev
COPY /code/package.json /code/bun.lockb /temp/dev/
RUN cd /temp/dev && bun install --frozen-lockfile

FROM base AS prerelease
COPY --from=install /temp/dev/node_modules node_modules
COPY . .

FROM base AS release
COPY --from=prerelease /usr/src/app/code/index.ts .
COPY --from=prerelease /usr/src/app/code/package.json .

# run the app
USER bun
EXPOSE 8080

ENTRYPOINT [ "bun", "run", "index.ts" ]
