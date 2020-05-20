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

2. Access Prometheus through port 9090
    ![](https://i.imgur.com/phnWNBw.png)
<br>

3. Access Grafana through port 3000 with initial username=admin, password=admin
    ![](https://i.imgur.com/zC87dT6.png)
<br>

4. Add the data source "Prometheus" to Grafana
    ![](https://i.imgur.com/SDxzD5P.png)
    ![](https://i.imgur.com/T5LUT8P.png)
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