FROM centos:7
MAINTAINER Aaron Kunde

COPY response /response
COPY scripts /scripts

ENV ORACLE_BASE=/opt/oracle
ENV ORACLE_HOME=$ORACLE_BASE/product/12.1.0.2/dbhome_1
ENV ORACLE_SID=orcl12c
ENV PATH=$PATH:$ORACLE_HOME/bin

ARG INSTALL_PATH=/install
ARG INSTALL_CREDENTIALS=
ARG INSTALL_SRC_BASEURL=

RUN /scripts/install_dependencies.sh \
    && /scripts/configure_users.sh \
    && chown oracle:oinstall /opt \
    && mkdir $INSTALL_PATH \
    && /scripts/prepare_installation_files.sh \
    && /scripts/install_database.sh \
    && rm -rf $INSTALL_PATH \
    && su oracle -c "dbca -silent -createDatabase -responseFile /response/dbca.rsp"

USER oracle

CMD ["/scripts/entrypoint.sh"]
