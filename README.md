Horizontal (auto)scaling: adding more machines to your resource pool

Vertical (auto)scaling: POD autoscaling based on load (observed CPU/RAM utilisation)

Resource Isolation: resource isolation using namespaces (multiple virtual clusters). K8s supports multiple virtual clusters backed by the same physical cluster
Network access management: achieved through services and ingresses

Control-Plane: Controller manager and Scheduler components of the master node.

High-Availability: multi-master cluster

Reconciliation-loop: maintaining the desired state of the cluster to achieve self-healing

Rolling Updates: default roll-out strategy in order to prevent down-time. Old pods are shutdown only after new pods of the new deployment version have started-up and became ready to handle traffic.

TLS Bootstrapping: usage of TLS certificates on nodes (for kubelet) in order to ensure that the communication with master components (apiserver) is private
