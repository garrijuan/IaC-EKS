# create cluster
```sh
eksctl create cluster --name development --dry-run
```
Last command return a basic yaml file
# crear cluster y nodos
```sh
eksctl create cluster -f Cluster.yaml

```
Inside CloudFormation modulu can see the stack with all steps, in this case we find two stack: cluster and nodes(ec2)

