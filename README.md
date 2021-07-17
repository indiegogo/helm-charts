# Indiegogo Helm Charts Repo

This is the official home for all Indiegogo helm charts

## How to Use Our Charts

* Add this repo to your helm
```helm repo add indiegogo https://charts.indiegogo.com/```
* Install the chart of your choice using your customized values.yaml file (assumes you have a working connection to a k8s cluster setup with kubectl)
```helm install my-onetimesecret-release indiegogo/onetimesecret -f values.yaml```

## How to contribute

* On a new branch add or modify charts in the charts directory
* Make sure you do a ```helm build update``` to update your Charts.lock
* If you add a chart of type Library please add it to the two --excluded-charts cli options found in .github/workflows/lint-test.yaml
* If you add a new helm chart repository not found in the ct.yaml file please add it there and also in the .github/workflows/release.yaml file.
* Submit a PR noting you will need to make sure your PR passes the automated tests and also that you will need a review from a codeowner such as the Indiegogo devops team.

## CODEOWNERS

We'd love to have more people in the codeowners.  If you think you've got a solid handle on helm charts and would like to help please ping the devops team to get yourself added.

## Actions in Use

* [@helm/kind-action](https://github.com/helm/kind-action)
* [@helm/chart-testing-action](https://github.com/helm/chart-testing-action)
* [@helm/chart-releaser-action](https://github.com/helm/chart-releaser-action)

### Workflow Notes

* The [Lint and Test Charts](/.github/workflows/lint-test.yaml) workflow uses [@helm/kind-action](https://www.github.com/helm/kind-action) GitHub Action to spin up a [kind](https://kind.sigs.k8s.io/) Kubernetes cluster, and [@helm/chart-testing-action](https://www.github.com/helm/chart-testing-action) to lint and test your charts on every Pull Request and push
* The [Release Charts](/.github/workflows/release.yaml) workflow uses [@helm/chart-releaser-action](https://www.github.com/helm/chart-releaser-action) to turn your GitHub project into a self-hosted Helm chart repo. It does this – during every push to `main` – by checking each chart in your project, and whenever there's a new chart version, creates a corresponding [GitHub release](https://help.github.com/en/github/administering-a-repository/about-releases) named for the chart version, adds Helm chart artifacts to the release, and creates or updates an `index.yaml` file on the gh_pages branch with metadata about those releases, which is then hosted on GitHub Pages
