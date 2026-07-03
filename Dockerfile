FROM keking/kkfileview-base:5.0.0
RUN addgroup -g 2001 appuser && \
    adduser -u 2001 -G appuser -M -s /sbin/nologin -D appuser
ADD server/target/kkFileView-*.tar.gz /opt/
WORKDIR /home/appuser
RUN chown -R appuser:appuser /opt/kkFileView-5.0.0 && \
    chown -R appuser:appuser /home/appuser
USER appuser
ENV KKFILEVIEW_BIN_FOLDER=/opt/kkFileView-5.0.0/bin
ENTRYPOINT ["java","-Dfile.encoding=UTF-8","-Dspring.config.location=/opt/kkFileView-5.0.0/config/application.properties","-jar","/opt/kkFileView-5.0.0/bin/kkFileView-5.0.0.jar"]
