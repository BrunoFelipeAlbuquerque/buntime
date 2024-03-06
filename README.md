#BUNTIME
This project was created using `bun init` in bun v1.0.20. [Bun](https://bun.sh) is a fast all-in-one JavaScript runtime.

##THE STACK
```
Bun
Nginx
Redis
Postgresql
PGAdmin
Redis
Redis Commander
Kafka
Kafka-ui
Zookeeper 
```

All to made easier to create **Event Driven** software.


##HOW TO RUN
Add the following to ```hosts``` file:

```
127.0.0.1   local.buntime.com
127.0.0.1   local.database-gui.com
127.0.0.1   local.cache-gui.com
127.0.0.1   local.event-store-gui.com
```

Run ```docker compose up``` and go to ```local.buntime.com``` to access the ```index.js``` of the project.