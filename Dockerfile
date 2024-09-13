FROM spark:3.5.1-scala2.12-java17-python3-ubuntu
ENV PATH=$PATH:/home/spark/.local/bin
ENV JAVA_HOME=/opt/java/openjdk
ENV SPARK_VERSION=3.5
ENV PYSPARK_PYTHON=/usr/bin/python3
USER root
RUN pip3 install pyspark
RUN pip3 install delta-spark==3.2.0
RUN pip3 install notebook
COPY ./app/ /usr/app/
RUN chmod +x /usr/app/start-spark.sh
CMD /usr/app/start-spark.sh
