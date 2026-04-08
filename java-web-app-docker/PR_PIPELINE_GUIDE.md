# Pull Request Pipeline Automation Guide

If you want your CI/CD pipeline to automatically run every time a developer raises a Pull Request (PR) against key branches, you can easily configure this by adding the `pull_request` trigger.

### 1. Adding the PR Trigger
You simply need to add the `pull_request` block under the `on:` section of your `.github/workflows/docker-ci-cd.yml` file:

```yaml
on:
  push:
    branches: [ "main", "assignment3" ]
  pull_request:
    branches: [ "main", "assignment3" ]
  workflow_dispatch:
```

#### How it operates:
With the `pull_request` trigger added, GitHub Actions will automatically initiate the pipeline the exact moment a developer raises a PR requesting to merge code into either the `main` or `assignment3` branch. Furthermore, if the developer pushes a new commit to fix a review comment on that same open PR, the pipeline will run again to ensure the fixes still pass the build.

---

### 2. 💡 Pro Tip: Prevent Pushing Broken Images on PRs

When you run pipelines on Pull Requests, the code isn't merged yet—meaning it might be experimental, broken, or purely for testing. 

You usually **do not** want to push these unmerged, experimental Docker images straight to your official Docker Hub account. For PRs, the goal is simply to verify that the app *builds successfully* and that the tests pass.

To achieve this, you can conditionally skip the final GitHub Action step that actually uploads the image. Update your "Build and push" step to check if the event is a PR before executing the `push` command:

```yaml
    - name: Build and push Docker image
      uses: docker/build-push-action@v5
      with:
        context: ./java-web-app-docker
        file: ./java-web-app-docker/Dockerfile
        # CRITICAL: Only push to Docker Hub if this is NOT a pull request!
        push: ${{ github.event_name != 'pull_request' }}
        tags: ${{ steps.meta.outputs.tags }}
        labels: ${{ steps.meta.outputs.labels }}
```

By adding that one dynamic expression (`${{ github.event_name != 'pull_request' }}`), GitHub will successfully test the entire build process during a PR, but will refrain from dirtying your Docker Hub registry until the PR is officially merged!
