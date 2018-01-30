
docker_run <- function(image, options = "-d", env = character(),
                       name = NULL, ...) {

  #rhs_env <- ifelse(is.na(env) | env=="", "", paste0("=", env))
  #equal_env <- paste0("-e ", names(env), rhs_env, collapse = " ")


  if(.Platform$OS.type == "windows") {
    h <- curl::new_handle()
    host <- "http://localhost:2375"
  } else {
    h <- curl::new_handle(unix_socket_path = "/var/run/docker.sock")
    host <- "http:/v1.24"
  }

  url <- paste(host, "images", "json", sep = "/")

  resp <- curl::curl_fetch_memory(url = url, handle = h)

  jsonlite::prettify(rawToChar(resp$content))

}
