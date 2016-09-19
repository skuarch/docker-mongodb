docker build -t skuarch/mongodb:latest .
docker run -d -p 27017:27017 -p 28017:28017 --name mongodb --net=host skuarch/mongodb:latest mongod --rest --httpinterface
docker start mongodb
