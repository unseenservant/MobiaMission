~~Object Storage~~

Configure Workload Federation to GH 
    - uses: 'google-github-actions/auth@v2'
    with:
        service_account: # project-owner-access@mobia-mission-aaron.iam.gserviceaccount.com
        workload_identity_provider: # "projects/1039028925758/locations/global/workloadIdentityPools/mobia-mission-pool/providers/unseenservant-github"

~~Image to Artifact Registry~~ # us-east1-docker.pkg.dev/mobia-mission-aaron/app-mobia/mobiaapp
~~Prove that GKE will create the LB on Ingress ~~

~~Kubernetes deploy app~~
~~test reaching app via LB/Ingress~~


refactor GitHub Actions
test github action pipeline w/WIF

tear down 02 & 01
redeploy 01 & 02
