package security;

import com.gigaspaces.client.WriteModifiers;
import org.openspaces.core.GigaSpace;
import org.openspaces.core.GigaSpaceConfigurer;
import org.openspaces.core.space.SpaceProxyConfigurer;

public class SecuredClient {

    static String space="demo";
    static String locators="localhost";
    static String user="gs-admin";
    static String pass="gs-admin";

    public static void main(String[] args) {

        if (args.length==4)
            { space=args[0];locators=args[1];user=args[2];pass=args[3];}
        else if (args.length==2)
            { space=args[0];locators=args[1];}
        else if (args.length==1)
            { space=args[0];}

            System.out.printf("MyFeeder is up" + "\n");
            Data[] objs = new Data[10];

            for (int i = 0; i < 10; i++) {
                objs[i] = new Data((long) i, Integer.toString(i));
            }

            long leaseExpiry = 300000L;
            long timeout = 5000L;
            gigaSpaceProxy().writeMultiple(objs, leaseExpiry, timeout, WriteModifiers.UPDATE_OR_WRITE);
    }
    static public GigaSpace gigaSpaceProxy () {
        SpaceProxyConfigurer urlSpaceConfigurer = new SpaceProxyConfigurer(space)
                .credentials(user, pass).lookupLocators(locators);

        return new GigaSpaceConfigurer(urlSpaceConfigurer).gigaSpace();
    }
}
