package resources.analysis

# get inputs
name = input.metadata.name
container := input.spec.template.spec.containers[_]

deny[msg] {
    is_deployment
    not container.resources.requests

    msg := sprintf("Deployment %v container %v does not include resource requests defintions", [name, container.name])
}

deny[msg] {
    is_deployment
    not container.resources.limits

    msg := sprintf("Deployment %v container %v does not include resource limits defintions", [name, container.name])
}

# check input kind
is_deployment { input.kind == "Deployment" }