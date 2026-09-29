# ReleasePulse Architecture

```text
                         ┌─────────────────┐
                         │     GitHub      │
                         │ Source + Git    │
                         └────────┬────────┘
                                  │ push
                                  ▼
                         ┌─────────────────┐
                         │ GitHub Actions  │
                         └───────┬─────────┘
                                 │
              ┌──────────────────┼──────────────────┐
              ▼                  ▼                  ▼
        ┌──────────┐       ┌──────────┐       ┌──────────┐
        │  Maven   │       │ SonarQube│       │  Tests   │
        │  Build   │       │ Analysis │       │  JUnit   │
        └────┬─────┘       └────┬─────┘       └──────────┘
             │                  │
             │ WAR              │ Quality Gate
             ▼                  ▼
        ┌───────────────────────────┐
        │           Nexus           │
        │     Artifact Repository   │
        └──────────────┬────────────┘
                       │
                       ▼
                 ┌──────────┐
                 │  Tomcat  │
                 │  Runtime │
                 └────┬─────┘
                      │
                      ▼
                ┌──────────────┐
                │ ReleasePulse │
                └──────────────┘
```
