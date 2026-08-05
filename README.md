# ElectricityBill

A Maven WAR application that calculates an electricity bill with Jakarta Servlet, JSP, Bootstrap 5, and Apache Tomcat 10.1+.

## Folder structure

```
ElectricityBill/
├── .project
├── .settings/
│   └── org.eclipse.wst.common.project.facet.core.xml
├── pom.xml
├── README.md
└── src/
    └── main/
        ├── java/com/electricitybill/servlet/
        │   └── BillServlet.java
        └── webapp/
            ├── index.jsp
            ├── result.jsp
            └── WEB-INF/web.xml
```

## Import into Eclipse

1. Open **Eclipse IDE for Enterprise Java and Web Developers**.
2. Select **File > Import > Maven > Existing Maven Projects**.
3. Select the `ElectricityBill` folder and click **Finish**.
4. If Eclipse requests a Java runtime, select a Java 17 (or newer) JDK.
5. If needed, right-click the project and select **Maven > Update Project**.

## Run on Apache Tomcat 10.1+

1. Install Apache Tomcat 10.1 or newer and configure it in Eclipse under **Window > Preferences > Server > Runtime Environments**.
2. Open the **Servers** view and create an Apache Tomcat 10.1 server.
3. Right-click the `ElectricityBill` project, choose **Run As > Run on Server**, then select the Tomcat server.
4. Open `http://localhost:8080/ElectricityBill/` in a browser.

## Build from a terminal

Run the following command from the project folder:

```bash
mvn clean package
```

Maven creates `target/ElectricityBill.war`, which can be copied to Tomcat's `webapps` folder.
