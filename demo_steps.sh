# Create the pod secutiry policies
kubectl apply -f psps/permissive.yaml
kubectl apply -f psps/restrictive.yaml

# Create the clusterroles
kubectl apply -f rbac/roles/permissive-clusterrole.yaml
kubectl apply -f rbac/roles/restrictive-clusterrole.yaml

# Create a restrictive clusterrolebinding that will
# bind the restrictive policy cluster-wide
kubectl apply -f rbac/bindings/restrictive-clusterrolebinding.yaml


# Create permissive rolebindings for specific service accounts
# that will bind the permissive policy with only a few service
# accounts defined under the subjects section
kubectl apply -f rbac/bindings/permissive-rolebinding

# Check the status of pods, deployments and replicasets
kubectl get all -A

# App demo with nginx deployments
# Create a new namespace for the demo. Also, create a service account for later
kubectl apply -f app_demo/ns-demo.yaml

# Create an nginx deployment that doesn't require hostNetwork access
kubectl apply -f app_demo/simple-nginx-deployment.yaml

# The above deployment should be up and running with all its pods in the running state
kubectl get all -n ns-demo

# You can check the annotations for nginx pods to validate
# that the restrictive policy is applied to the pods
kubectl -n ns-demo get po <POD_NAME> -o jsonpath='{.metadata.annotations}'

# Now, create the nginx deployment that requires privileged access
kubectl apply -f app_demo/priv-nginx-deployment.yaml

# The deployment will not have any pods deployed
kubectl get all -n ns-demo

# Check the replica set for the error
kubectl -n ns-demo describe rs <priv-nginx-someid>

# Now, let's create a rolebinding that binds the nginx service account with
# the permissive policy. Note, that our privileged deployment used the nginx
# service account
kubectl apply -f app_demo/nginx-rolebinding.yaml