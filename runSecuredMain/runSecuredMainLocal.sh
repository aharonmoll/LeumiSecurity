#run as following:
# ./runSecuredMain.sh demo gs-admin gs-admin

export GS_LOOKUP_LOCATORS=localhost
export GS_LOOKUP_GROUPS=xap-15.8.0
export GS_NIC_ADDRESS=localhost

CLASSPATH=/Users/aharonmoll/IdeaProjects/LeumiSecurity/runSecuredMain/target/runSecuredMain-1.0-SNAPSHOT.jar
CLASSPATH=/Users/aharonmoll/XAPBuilds/gigaspaces-smart-ods-enterprise-15.8.0/bin:${CLASSPATH}
CLASSPATH=/Users/aharonmoll/XAPBuilds/gigaspaces-smart-ods-enterprise-15.8.0/lib/required/*:${CLASSPATH}


echo $CLASSPATH
${JAVA_HOME}/bin/java -cp ${CLASSPATH} \
-Dcom.gs.jini_lus.locators=${GS_LOOKUP_LOCATORS} \
-Dcom.gs.jini_lus.groups=${GS_LOOKUP_GROUPS} \
security.SecuredClient $1 $GS_LOOKUP_LOCATORS $2 $3
