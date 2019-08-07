# gke_tutorial

Trial for GKE tutorial

## Requirements

### Tools

- gcloud
- kubectl (>= 1.14.x)
- kustomize

We can check tool requirements as follows.

```
$ make doctor
```

### GCP

- Accounts who has permissions following roles give:
   - roles/container.admin
   - roles/deploymentmanager.editor
   - roles/iam.serviceAccountUser
- Enabled API on your project:
   - iam.googleapis.com
   - deploymentmanager.googleapis.com
   - compute.googleapis.com
   - container.googleapis.com
