FROM spark:3.5.1-scala2.12-java17-python3-ubuntu
ENV PATH=$PATH:/home/spark/.local/bin
ENV JAVA_HOME=/opt/java/openjdk
ENV SPARK_VERSION=3.5
ENV PYSPARK_PYTHON=/usr/bin/python3
USER root
COPY ./app/ /usr/app/
WORKDIR /usr/app/
RUN pip3 install -r requirements.txt
RUN chmod +x start-spark.sh
CMD start-spark.sh
