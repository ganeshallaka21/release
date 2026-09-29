# ReleasePulse 🚀

**ReleasePulse** is a modern Java web dashboard for tracking software releases, deployment environments, pipeline health, and release confidence.

This application is intentionally built as a real portfolio project for a **CI/CD and DevOps pipeline**.

## What it demonstrates

- Java 21
- Maven
- Jakarta Servlet / WAR packaging
- Tomcat 10+
- Automated testing
- GitHub Actions
- SonarQube code-quality analysis
- Nexus artifact management
- Automated deployment

## Application idea

ReleasePulse gives a team one place to see:

- Current application version
- Deployment status across environments
- Pipeline health
- Recent releases
- Release metrics
- Deployment notes

## Local build

```bash
mvn clean test
mvn clean package
```

The generated artifact is:

```text
target/releasepulse.war
```

## Run on Tomcat

Copy `releasepulse.war` into Tomcat's `webapps` directory and start Tomcat.

Open:

```text
http://localhost:8080/releasepulse/
```

## Planned CI/CD flow

```text
Developer
   |
   v
GitHub
   |
   v
GitHub Actions
   |
   +----> Maven Build & Tests
   |
   +----> SonarQube
   |          |
   |          v
   |      Quality Gate
   |
   v
Nexus Repository
   |
   v
Tomcat
   |
   v
ReleasePulse
```

## Project structure

```text
releasepulse/
├── src/
│   ├── main/
│   │   ├── java/com/releasepulse/
│   │   │   ├── DashboardServlet.java
│   │   │   └── ReleaseService.java
│   │   └── webapp/
│   │       ├── index.jsp
│   │       └── assets/
│   │           └── style.css
│   └── test/
│       └── java/com/releasepulse/
│           └── ReleaseServiceTest.java
├── pom.xml
├── .gitignore
└── README.md
```

> The application is deliberately small enough to understand while looking polished enough to showcase the CI/CD project on GitHub.
