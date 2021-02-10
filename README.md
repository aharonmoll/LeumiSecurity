# 15_5_security

### Password Encryption Lab Exercise
#### Requirements: <br />

1. Edit the security-config.xml file <br />
2. encrypt and write the passwords for “anna”, “dave” and “adam” <br /> 
3. use org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder <br />
4. Verify that you can login through the Ops Manager 

### Writing to a Secured Space - Lab Exercise
#### Requirements: <br />
1. Write a PU contains: <br />
    a) a secured embedded space configured in the pu.xml (use plain text for the user/password) <br />
    b) a Spring Bean for the Feeder <br />
       the Feeder will have 2 methods: <br />
            public GigaSpace gigaSpaceProxy() - for connecting to the secured space <br />
            public void afterPropertiesSet() - for writing data <br />
    

#### Questions: <br />
1. What user will you use? <br />
2. What privileges this user should have?

