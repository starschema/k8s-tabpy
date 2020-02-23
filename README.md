# Public TabPy Server for the People!

Free to use [TabPy](https://github.com/tableau/TabPy/) Server to test Tableau Desktop, Server and Prep Builder python integration. 

## How to use it

These are the connection information:

    Hostname: `tabpy.starschema.com`
    Port: `9004`

How to configure: https://help.tableau.com/current/pro/desktop/en-us/r_connection_manage.htm#configure-an-external-service-connection

![Config window](https://help.tableau.com/current/pro/desktop/en-us/Img/ext_serv_1.png)

## Why this image?

Designed for kubernetes, this tabpy/docker runs preinitalized with the demo goodies. To keep things secure, it is running as 
non-privileged container, as non-root user, on busybox based Alpine. 

## Credits

I took ideas from @faizanbashir's [python datascience docker](https://github.com/faizanbashir/python-datascience/blob/master/Dockerfile) and
@erichannel's [tabpy container](https://github.com/erichannell/TabPy-docker/blob/master/Dockerfile). And most importantly, Ken Flerlage give
the idea to make this available. 

Runs on Alpine Linux 3.11 and Python 3.7.

## License

BSD-3 
