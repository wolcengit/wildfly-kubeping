FROM jboss/wildfly:10.1.0.Final

LABEL MAINTAINER Andre Fernandes <andrevcf@gmail.com>

USER root

COPY docker-entrypoint.sh $JBOSS_HOME/docker-entrypoint.sh
RUN chown jboss $JBOSS_HOME/docker-entrypoint.sh && \
 	chmod a+x $JBOSS_HOME/docker-entrypoint.sh

#KUBE_PING
COPY kubeping-module $JBOSS_HOME/modules/system/layers/base/org/jgroups/kubernetes

COPY standalone-ha.xml $JBOSS_HOME/standalone/configuration/
COPY standalone-full-ha.xml $JBOSS_HOME/standalone/configuration/


EXPOSE 8080 8009 9990 7600 8888

ENTRYPOINT $JBOSS_HOME/docker-entrypoint.sh
