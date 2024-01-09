# Steps to reproduce

```bash
docker buildx create --use
docker buildx bake child # Populate cache
docker buildx bake child # Note cache used for parent/child in this build
docker buildx prune
docker buildx bake parent # Note cache used for parent
docker buildx bake child # Note cache invalidated for child, because of COPY in parent
```

Now, remove the `COPY` instruction from `Dokerfile.parent` and observe that the cache is not invalidated for the child when re-running the above steps.
