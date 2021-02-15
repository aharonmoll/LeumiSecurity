#run as following:
# ./runSecuredMain.sh demo gs-admin gs-admin

export GS_LOOKUP_LOCATORS=10.0.0.164,10.0.0.188,10.0.0.175
export GS_LOOKUP_GROUPS=xap-15.8.0
export GS_NIC_ADDRESS=10.0.0.129

CLASSPATH=/home/ec2-user/runSecuredMain-1.0-SNAPSHOT.jar
CLASSPATH=/opt/gigaspaces-smart-ods-enterprise-15.8.0/bin:${CLASSPATH}
CLASSPATH=/opt/gigaspaces-smart-ods-enterprise-15.8.0/lib/required/*:${CLASSPATH}


echo $CLASSPATH
${JAVA_HOME}/bin/java -cp ${CLASSPATH} \
-Dcom.gs.jini_lus.locators=${GS_LOOKUP_LOCATORS} \
-Dcom.gs.jini_lus.groups=${GS_LOOKUP_GROUPS} \
-Dcom.gs.lrmi.filter.factory=com.gigaspaces.lrmi.nio.filters.SSLFilterFactory \
-Dcom.gs.lrmi.filter.security.keystore=/opt/gigaspaces-smart-ods-enterprise-15.8.0/bin/client_keystore.jks \
-Dcom.gs.lrmi.filter.security.password=changeit \
-Djavax.net.debug=ssl \
-Dcom.gs.lrmi.filter.security.protocol=TLSv1.2 \
security.SecuredClient $1 $GS_LOOKUP_LOCATORS $2 $3
