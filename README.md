# Kafka monitoring

### Synopsis
This project integrates Prometheus and Grafana to monitor the Kafka status.

### Usage
1. Execute start.sh or docker-compose up
    ```
    ./start.sh
    ```
    ```
    docker-compose up --build -d
    ```
<br>

2. Access Prometheus through port 9090<br>
    ![](https://i.imgur.com/phnWNBw.png)
<br>

3. Access Grafana through port 3000 with initial username=admin, password=admin<br>
    ![](https://i.imgur.com/zC87dT6.png)
<br>

4. Add the data source "Prometheus" to Grafana<br>
    ![](https://i.imgur.com/SDxzD5P.png)<br>
    ![](https://i.imgur.com/T5LUT8P.png)<br>
    <br>
    -----------------**Input `http://prometheus:9090`**-------------------
    ![](https://i.imgur.com/MRaK0GO.png)
<br>

5. Import your dashboard manually
<br>

6. Shut down the services
    ```
    ./stop.sh
    ```
    ```
    docker-compose down -v
    ```

### Zookeeper
* 4lw tool (need to install `nc` first)
    refer: https://blog.csdn.net/u013673976/article/details/47279707
<br>

* zkCli tool
    1. enter a zookeeper container
    2. execute zkCli
        ```
        ./bin/zkCli.sh
        ```
    3. example
        * check brokers
            ```
            ls /brokers/ids
            ```
        * check topics
            ```
            ls /brokers/topics
            ```

### Kafka
* kafka built-in producer & consumer
    1. enter a kafka container
    2. move to bin folder
        ```
        cd /opt/kafka/bin/
        ```
    3. execute a producer
        ```
        ./kafka-console-producer.sh --broker-list kafka1:9093 kafka2:9093 kafka3:9093 --topic test
        ```
    4. open another terminal and repeate the step 1&2 to execute a consumer
        ```
        ./kafka-console-consumer.sh --bootstrap-server kafka1:9093 kafka2:9093 kafka3:9093 --topic test --from-beginning
        ```
    5. key in the data in the producer terminal