# Understanding Pod Security Policies

## K8s Pune Meetup Talk
[Pod Security Policies](https://www.youtube.com/watch?v=FOzgVbOpEHA)

## How to use the files in this repo
1. Clone this repo
```
git clone https://github.com/platform9/pod-security-policy-demo.git
```
2. Get the KUBECONFIG for your cluster and set it as the active KUBECONFIG
```
export KUBECONFIG=/path/to/your/kubeconfig.yaml
```
3. Run the commands in [demo_steps.sh](demo_steps.sh) sequentially.

## References
1. [Pod Security Policies](https://kubernetes.io/docs/concepts/policy/pod-security-policy/)
2. [PodSecurityPolicy Deprecation: Past, Present, and Future](https://kubernetes.io/blog/2021/04/06/podsecuritypolicy-deprecation-past-present-and-future/)
3. [Using RBAC Authorization](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)
4. [Using Admission Controllers](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/)
