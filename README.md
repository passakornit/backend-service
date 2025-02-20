**Candidate Assignment Instructions:**

The sample application is developed using Go. Our development team would like to deliver this application to Production. As a DevOps engineer, you are responsible to complete the tasks by following these key areas: High Availability, Scalability, Security.

**Task:**

1. Create a Dockerfile for a given application

   - Dockerfile

2. Build the image using the Dockerfile and push to Docker Hub

    - Include it in the Jenkinsfile.

3. Create a Kustomize manifest to deploy the image from the previous step. The Kustomize should have flexibility to allow Developer to adjust values without having to rebuild the Kustomize frequently

    - This part is separated from the main repository and available at: https://github.com/passakornit/devops-test.git

4. Setup GKE cluster with the related resources to run GKE like VPC, Subnets, etc. by following GKE Best Practices using any IaC tools (Terraform, OpenTufo, Pulumi) (Bonus point: use Terraform/Terragrunt)

    - https://github.com/passakornit/devops-test.git 
    - Use gcloud auth application-default login to avoid injecting GCP keys directly. Ensure the GCP account has the necessary access permissions.

* Condition: Avoid injecting the generated GCP access keys to the application directly. **Expected Output:** Kustomize manifest, IaC code or anything to complete this task.

5. Use ArgoCD to deploy this application. To follow GitOps practices, we prefer to have an ArgoCD application defined declaratively in a YAML file if possible.

    - Deployment with ArgoCD can be done in several ways:
      1.Deploy by manually updating the tag version in the kustomization file and pushing it to Git.
      2.Use a Jenkins pipeline to update the tag version and push it to Git.
      3.The chosen method is to use the Argo image updater to update the image tag version in the kustomization file. (The benefit is avoiding conflicts in Git, but additional installation and configuration will be required.)
        
6. Create CICD workflow using GitOps pipeline to build and deploy application **Expected output:** GitOps pipeline (Github, Gitlab, Bitbucket, Jenkins) workflow or diagram

    - The CICD workflow will divide Git work between Developers and DevOps by separating it into two repositories.The pipeline flow will use Jenkins to build and push the image by creating a tag version on the Developer Git repository for easier version tracking of the code.ArgoCD will then be used to deploy the application.
