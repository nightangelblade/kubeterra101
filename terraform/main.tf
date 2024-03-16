resource "kubernetes_namespace" "k8s-fast-api" {
  metadata {
    name = "k8s-fast-api"
  }
}

resource "kubernetes_deployment" "k8s-fast-api" {
  metadata {
    name      = "k8s-fast-api"
    namespace = kubernetes_namespace.k8s-fast-api.metadata.0.name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "k8s-fast-api"
      }
    }
    template {
      metadata {
        labels = {
          app = "k8s-fast-api"
        }
      }
      spec {
        container {
          image = "docker.io/library/k8s-fast-api:0.0.1"
          name  = "k8s-fast-api"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "k8s-fast-api" {
  metadata {
    name      = "k8s-fast-api"
    namespace = kubernetes_namespace.k8s-fast-api.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.k8s-fast-api.spec.0.template.0.metadata.0.labels.app
    }
    port {
      port = 80
    }
  }
}