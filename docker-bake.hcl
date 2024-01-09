target "parent" {
  dockerfile = "Dockerfile.parent"
  cache-to = ["type=local,dest=./cache/parent,mode=max"]
  cache-from = ["type=local,src=./cache/parent"]
  tags = ["parent"]
  output = ["type=docker"]
}

target "child" {
  dockerfile = "Dockerfile.child"
  cache-to = ["type=local,dest=./cache/child,mode=max"]
  cache-from = ["type=local,src=./cache/child"]
  tags = ["child"]
  output = ["type=docker"]
  contexts = {
    parent = "target:parent"
  }
}