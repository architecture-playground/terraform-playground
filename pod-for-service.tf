resource "kubernetes_pod" "simple1" {
  metadata {
    name = "simple-service"
    labels = {
      App = "simple-1"
    }
  }
  spec {
    container {
      image = "architectureplayground/simple-service"
      name = "simple-service"
      port {
        container_port = 15777
      }
    }
  }
}

resource "kubernetes_service" "simple" {
  metadata {
    name = "simple-example"
  }
  spec {
    selector = {
      App = kubernetes_pod.simple1.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 15777
    }

    type = "LoadBalancer"
  }
}
