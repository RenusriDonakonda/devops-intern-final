job "hello" {
  datacenters = ["dc1"]
  type = "service"

  group "hello-group" {
    task "hello-task" {
      driver = "docker"

      config {
        image = "renusrid/hello-devops:latest"
      }

      resources {
        cpu    = 100  # MHz
        memory = 64   # MB
      }
    }
  }
}