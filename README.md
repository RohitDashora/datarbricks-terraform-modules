
```python
#   _      ____  ____  _  __   _  _        ____  ____  ____  _____ ____  _____ ____  ____ 
#  / \  /|/  _ \/  __\/ |/ /  / \/ \  /|  /  __\/  __\/  _ \/  __//  __\/  __// ___\/ ___\
#  | |  ||| / \||  \/||   /   | || |\ ||  |  \/||  \/|| / \|| |  _|  \/||  \  |    \|    \
#  | |/\||| \_/||    /|   \   | || | \||  |  __/|    /| \_/|| |_//|    /|  /_ \___ |\___ |
#  \_/  \|\____/\_/\_\\_|\_\  \_/\_/  \|  \_/   \_/\_\\____/\____\\_/\_\\____\\____/\____/
#                                                                                         
```

# Databricks terraform modules
This repository contains Terraform code for deploying databricks on various cloud platforms.

## Getting Started

1. Install Terraform:

```console
 wget https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip
unzip terraform_0.12.29_linux_amd64.zip
sudo mv terraform /usr/local/bin/
```

2. Clone this repository:

```console
git clone https://github.com/<your-username>/terraform-code-repo.git
```

3. Change to the directory containing the code for the infrastructure you want to deploy:

```console
cd terraform-code-repo/<infrastructure-name>
```

4. Initialize Terraform:
```console
terraform init
```

5. Preview the infrastructure that will be created:

```console
terraform plan
```

6. Apply the changes to create the infrastructure:

```console
terraform apply
```

## Contributing

We welcome contributions to this repository! Please follow these guidelines:

- Fork this repository and create a new branch for your changes.
- Make your changes and add appropriate tests.
- Run the tests to ensure they all pass.
- Submit a pull request for review.

Thanks for your help!