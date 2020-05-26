resource "kubernetes_pod" "simple-service" {
  metadata {
    name = "simple-service"
  }
  spec {
    container {
      image = "architectureplayground/simple-service"
      name = "simple-service"
      port {
        container_port = 15777
      }

      liveness_probe {
        http_get {
          path = "/actuator/health"
          port = 15777

        }

        initial_delay_seconds = 30
        period_seconds = 30
        failure_threshold = 30
        success_threshold = 1
        timeout_seconds = 20
      }
    }
  }
}
