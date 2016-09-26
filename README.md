## Example S2I builder image for Websphere Liberty Profile

## Creating Builder image
```
oc new-build https://github.com/noelo/liberty-s2i.git --strategy=docker
```

#### Due to the websphere liberty profile requiring root access the builder and default service accounts need to be in the anyuid SCC

```
oadm policy add-scc-to-user anyuid -z default
oadm policy add-scc-to-user anyuid -z builder
```

## Create the app build using the binary build process
```
oc new-build --binary --name=simpleservlet -l app=demo -i liberty-s2i
oc start-build simpleservlet --from-file=SimpleServlet.war --follow
```

### Deploy the App on openshift
```
oc new-app simpleservlet
oc expose service simpleservlet
```

### Alternatively run the app
```
oc run  --image=172.30.93.103:5000/liberty2/simpleservlet simpleservlet
```
