# Inside the container 
# Start Spark master
$SPARK_HOME/sbin/start-master.sh
# Find the container IP address
container_ip=$(hostname -I | awk '{print $1}')
# Start Spark worker
$SPARK_HOME/sbin/start-worker.sh spark://$container_ip:7077

export PYSPARK_DRIVER_PYTHON='jupyter'
export PYSPARK_DRIVER_PYTHON_OPTS='notebook --no-browser --port=8889 --allow-root --ip="0.0.0.0" --notebook-dir=/working_dir'

pyspark --packages io.delta:delta-spark_2.12:3.2.0 --conf "spark.sql.extensions=io.delta.sql.DeltaSparkSessionExtension" --conf "spark.sql.catalog.spark_catalog=org.apache.spark.sql.delta.catalog.DeltaCatalog"