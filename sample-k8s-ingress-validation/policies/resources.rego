package ingress.analysis

ingress := input.spec.rules[_]
ingresses := data.spec.rules[_]

deny[msg] {
    ingress.host == ingresses.host

    msg := sprintf("Ingress hostname %v is already in use.", [ingresses.host])
}
