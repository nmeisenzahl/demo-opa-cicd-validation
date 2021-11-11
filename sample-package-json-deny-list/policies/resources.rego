package packages.analysis

# denied dependencies
denied = {
	"@types/chart.js",
    "chart.js",
    "tslib"
}

deny[msg] {
    input.dependencies[i]
    denied[i]
    
    msg := sprintf("The project uses a non-permitted dependency: %v.", [i])
}
