# API Conventions

- Supported verbs - `POST|PUT|DELETE|GET`
- All of the JSON accepted and returned by server has a `schema`, identified by `kind` and `apiVersion` fields.

- **kind**:
  - represents name of a particular object.
  - Kind is a string value representing the REST resource this object represents.

- **Resource**:
  - a representation of a system entity, sent or retrieved as JSON via HTTP to the server. Resources are exposed via:
    - Collections - a list of resources of the same type, which may be queryable
    - Elements - an individual resource, addressable via a URL

- **API Group**:
  - a set of resources that are exposed together. 
  - Along with the version is exposed in the "apiVersion" field as "GROUP/VERSION", e.g. "policy.k8s.io/v1".
