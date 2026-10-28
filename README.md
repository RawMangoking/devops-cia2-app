# hello-app – DevOps CIA-2 CI/CD Pipeline

A minimal Java (Spring Boot) web app that shows one word. Every push to `main`
is automatically built, tested, packaged into a Docker image, pushed to Docker Hub
and deployed to Azure Kubernetes Service (AKS) using Ansible.

## Files
| File | Purpose |
| --- | --- |
| `src/main/java/.../HelloApplication.java` | Starts the web server |
| `src/main/resources/static/index.html` | The page (change the word here) |
| `src/test/java/.../HelloApplicationTest.java` | 2 automated tests |
| `pom.xml` | Maven build file |
| `Dockerfile`, `.dockerignore` | Docker image |
| `k8s/deployment.yaml`, `k8s/service.yaml` | Kubernetes manifests |
| `ansible/inventory.ini`, `ansible/deploy.yml` | Ansible deployment |
| `.github/workflows/ci-cd.yml` | CI/CD pipeline |

## Run locally
```
mvn clean package
java -jar target/app.jar        # open http://localhost:8080
```

## Pipeline steps
Checkout → Java 17 → Compile → Test → Package → Docker login → Build image →
Push image → Connect to cluster → Install Ansible → Deploy with Ansible → Verify

## Required GitHub secrets
- `DOCKERHUB_TOKEN` – Docker Hub access token
- `KUBE_CONFIG` – contents of the AKS kubeconfig file

## Demo
Change the word in `index.html`, commit and push. The pipeline redeploys automatically;
refresh the browser to see the new word.
