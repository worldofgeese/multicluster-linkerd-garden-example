# Multi-cluster with Linkerd and Garden using Config Templates

> **Warning**
> This project requires user action before deployment. Follow the instructions in the 3 Notes below before running `garden deploy`.

This example demonstrates the config templating feature, which allows users to define templates that generate multiple templated actions.

In this example we define a `ConfigTemplate` in [template/garden.yml](./template/garden.yml), and use that template in [service/garden.yml](./service/garden.yml) to generate a `container` Build to build a container image, and a `kubernetes` Deploy that deploys that image.

This allows teams to reduce the boilerplate in their projects, as well as to tailor deployments to their specific needs.

> **Note**
> This Garden project expects a local Kubernetes cluster initialized. The default is set to "minikube". If you use another local Kubernetes flavor, change the variable, `localCluster`, defined at the bottom of the `project.garden.yml` in the project root. 

Garden uses its Terraform plugin to build an additional, remote cluster on Civo.

> **Note**
> Before deployment, be sure to have your Civo token exported as `CIVO_TOKEN` first. You can generate a Civo token [here](https://dashboard.civo.com/security).

> **Note**
> Change `registryHostname` and `registryNamespace` in [project.garden.yml](./garden.yml) to your own Docker registry and namespace. Log in to your registry with `docker login`. Double-check any other variables defined under `variables:` in [project.garden.yml](./project.garden.yml) to ensure they match your desired configuration.

To see the generated action in detail, you can run `garden get actions --output=yaml`.

To test the example with your remote Kubernetes cluster, simply run `garden deploy --env testing`. Destroy your project and cluster with `garden cleanup namespace`.

For more complex use-cases and additional configuration options please refer to the [docs](https://docs.garden.io/using-garden/module-templates).
