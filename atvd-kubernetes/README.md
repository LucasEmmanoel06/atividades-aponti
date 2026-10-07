# Arquitetura Kubernetes

Atividade em dupla do curso de DevOps. Este projeto apresenta a arquitetura do Kubernetes em um diagrama (`kubernetes.drawio`), a descrição das principais ferramentas (este README) e a implementação de um Pod e de um Service (`pod.yml` e `service.yml`) executados no Minikube.

## Estrutura do projeto

```
atvd-kubernetes/
├── kubernetes.drawio   # desenho da arquitetura
├── README.md           # descrição das ferramentas
├── pod.yml             # implementação de um Pod
└── service.yml         # implementação de um Service
```

## O que é o Kubernetes

Kubernetes (K8s) é uma plataforma open source de orquestração de containers. Ele automatiza a implantação, o escalonamento, a atualização e a recuperação de aplicações em containers, distribuindo-os em várias máquinas.

## Visão geral da arquitetura

Um **Cluster** Kubernetes é formado por dois tipos de componentes:

- **Control Plane**: o "cérebro" do cluster, responsável por tomar decisões e manter o estado desejado.
- **Worker Nodes**: as máquinas que de fato executam os containers das aplicações.

O usuário interage com o cluster pelo `kubectl`, que envia comandos para o API Server do Control Plane.

## Control Plane

| Componente | Descrição |
|---|---|
| **API Server** | Porta de entrada do cluster. Recebe todas as requisições (do `kubectl`, de outros componentes e de aplicações), valida e processa. É o único componente que conversa diretamente com o etcd. |
| **etcd** | Banco de dados chave-valor distribuído que guarda todo o estado e a configuração do cluster. |
| **Scheduler** | Decide em qual Node cada novo Pod será executado, considerando recursos disponíveis (CPU e memória), regras e restrições. |
| **Controller Manager** | Executa os controladores que monitoram o estado atual do cluster e agem para alcançá-lo ao estado desejado (por exemplo, recriar um Pod que falhou). |

## Worker Node

| Componente | Descrição |
|---|---|
| **Kubelet** | Agente que roda em cada Node. Recebe as instruções do API Server, garante que os containers dos Pods estejam rodando e reporta o status de volta. |
| **Kube-proxy** | Gerencia as regras de rede do Node e permite a comunicação entre Pods e Services, fazendo o balanceamento do tráfego. |
| **Container Runtime** | Software que executa os containers (por exemplo, containerd ou Docker). |

## Objetos e ferramentas do Kubernetes

| Item | Descrição |
|---|---|
| **kubectl** | Ferramenta de linha de comando para controlar o cluster. Exemplos: `kubectl apply`, `kubectl get pods`, `kubectl describe`, `kubectl delete`. |
| **Minikube** | Ferramenta que cria um cluster Kubernetes local (de um único Node) para estudo e testes. |
| **Cluster** | Conjunto formado pelo Control Plane e pelos Worker Nodes. |
| **Node** | Máquina (física ou virtual) que faz parte do cluster. |
| **Pod** | Menor unidade do Kubernetes. Agrupa um ou mais containers que compartilham rede e armazenamento. É efêmero: se morrer, não volta sozinho, a menos que seja gerenciado por um ReplicaSet ou Deployment. |
| **ReplicaSet** | Garante que um número definido de réplicas de um Pod esteja sempre em execução. Se um Pod cair, cria outro. |
| **Deployment** | Gerencia ReplicaSets e permite atualizações graduais (rolling update) e rollback de versões. |
| **Service** | Fornece um endereço de rede estável e balanceamento de carga para um conjunto de Pods, já que os IPs dos Pods mudam. |
| **Labels e Selectors** | Labels são etiquetas (chave-valor) nos objetos; Selectors usam essas etiquetas para encontrar objetos. É assim que o Service sabe para quais Pods enviar o tráfego. |
| **Namespace** | Divisão lógica do cluster para organizar e isolar recursos. |

### Tipos de Service

- **ClusterIP** (padrão): expõe o serviço apenas dentro do cluster.
- **NodePort**: expõe o serviço em uma porta fixa de cada Node, permitindo acesso externo.
- **LoadBalancer**: cria um balanceador de carga externo (em provedores de nuvem).

## Fluxo de funcionamento

1. O usuário executa `kubectl apply -f pod.yml`.
2. O `kubectl` envia a requisição ao **API Server**.
3. O API Server valida e grava o estado desejado no **etcd**.
4. O **Scheduler** escolhe o Node onde o Pod vai rodar.
5. O **Kubelet** daquele Node cria o container usando o **Container Runtime**.
6. O **Kube-proxy** configura a rede, e o **Service** passa a direcionar o tráfego para o Pod.
7. O **Controller Manager** continua monitorando para manter o estado desejado.

## Execução no Minikube

```bash
minikube start
kubectl apply -f pod.yml
kubectl apply -f service.yml
kubectl get pods
kubectl get svc
minikube service <nome-do-service>
```

> Os prints da execução e do acesso pelo navegador ficam anexados na entrega.

## Integrantes

- Gabriela Pires Silva do Nascimento: diagrama no Drawio e README
- Lucas Emmanoel: `pod.yml`, `service.yml` e execução no Minikube

## Referências

- Slides da unidade 9 (material de apoio do curso)
- Documentação oficial: https://kubernetes.io/docs/concepts/
