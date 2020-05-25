# Kafka monitoring

### Synopsis
This project integrates Prometheus and Grafana to monitor the Kafka status.

### Usage
1. Execute start.sh
    ```
    ./start.sh
    ```
<br>

2. Access Prometheus through port 9090<br>
    ![](https://i.imgur.com/phnWNBw.png)
<br>

3. Access Grafana through port 3000 with initial username=admin, password=admin<br>
    ![](https://i.imgur.com/zC87dT6.png)
<br>

4. Shut down the services
    ```
    ./stop.sh
    ```

### Zookeeper
* Zookeeper settings
    * Limit the resources usage with (cpu=0.3, memory=200M / per zookeeper)
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
* Kafka settings
    * Users can create topics initially by 'kafka3' in the docker compose file.
    * There are three topics by default
        * js.eval.requests：10 partitions, 1 replica
        * tb.rule-engine：3 partitions, 3 replicas
        * tb.transport.api.requests：3 partitions, 3 replicas
    * Decrease the default partition and replica number for topic '__consumer_offsets' to 10 partitions, 3 replicas
    * Limit the resources usage with (cpu=0.5, memory=1G / per broker)
<br>

* kafka built-in producer & consumer
    1. enter a kafka container
    2. move to bin folder
        ```
        cd /opt/kafka/bin/
        ```
    3. execute a producer
        ```
        ./kafka-console-producer.sh --broker-list kafka1:9093 kafka2:9093 kafka3:9093 --topic [topic_name]
        ```
    4. open another terminal and repeate the step 1&2 to execute a consumer
        ```
        ./kafka-console-consumer.sh --bootstrap-server kafka1:9093 kafka2:9093 kafka3:9093 --topic [topic_name] --from-beginning --group [group_name]
        ```
    5. key in the data in the producer terminal

### Grafana
* Include a built-in dashboard for Kafka
    ![](https://i.imgur.com/VsP2zmZ.png)
<br>

* Refer
    * https://ops.tips/blog/initialize-grafana-with-preconfigured-dashboards/
    * https://github.com/cirocosta/sample-grafana