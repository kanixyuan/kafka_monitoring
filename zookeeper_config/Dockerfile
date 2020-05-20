FROM zookeeper:3.5

RUN mkdir /prometheus
ADD "https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.13.0/jmx_prometheus_javaagent-0.13.0.jar" /prometheus
RUN chmod 644 /prometheus/jmx_prometheus_javaagent-0.13.0.jar
ADD zookeeper_metrics_output_rules.yaml /prometheus/zookeeper_metrics_output_rules.yaml