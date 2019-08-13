# gke_tutorial

Trial for GKE tutorial

## Requirements

### Tools

- gcloud
- kubectl (>= 1.14.x)
- kustomize
- peco

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
- Your activated configuration must have default setting values:
   - project
   - compute/region
   - compute/zone

```bash
# Check whether your account has proper roles
$ gcloud projects get-iam-policy <project_id>

# Check whether required services are enabled
$ gcloud services list --enabled

# Check whether default settings values are set
$ gcloud config configurations list
```

## Tutorial

```bash
$ make cluster # Select 'create' task via peco
or
$ (cd cluster; make create)

$ make cluster # Select 'config' task via peco
or
$ (cd cluster; make config)


$ make stateless # Select 'create' task via peco
or
$ (cd quickstart/stateless; make create)

$ make stateless # Select 'destroy' task via peco
or
$ (cd quickstart/stateless; make destroy)


$ make cluster # Select 'destroy' task via peco
or
$ (cd cluster; make destroy)
```
