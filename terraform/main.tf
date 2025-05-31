terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Imagen de Nginx
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Contenedor Nginx
resource "docker_container" "nginx_html" {
  name  = "mi_sitio_web_${var.build_number}"  # Use a variable for unique naming
  image = docker_image.nginx.name
  ports {
    internal = 80
    external = 8888
  }

  volumes {
    host_path      = abspath("${path.module}/../html")
    container_path = "/usr/share/nginx/html"
  }
}
