# Understanding Terraform Variables Made Simple

Terraform is a powerful tool used to manage infrastructure as code, and variables make it easier to reuse and customize configurations. Let’s break down different types of variables in Terraform in a simple way that even a 10-year-old can understand.

---

## **1. Environment Variables**
Imagine you have a magic notebook where you write secret codes, like passwords or project settings. 

In Terraform, **environment variables** are like those secret codes you keep safe outside of your main project. You can use them to set values without directly writing them in your Terraform files.

### Example:
Run this command in your terminal:
```bash
export TF_VAR_key="value"
```
Here:
- `TF_VAR_key` = The magic secret you are defining (key).
- `value` = The information you’re keeping (like a password).

Terraform will automatically use this value when it runs.

---

## **2. `terraform.tfvars` File**
Imagine you have a notebook where you write down all your homework assignments in one place. The `terraform.tfvars` file is like that notebook.

You create a file called `terraform.tfvars` and write down your variables and their values.

### Example:
```hcl
key = "value"
region = "us-east-1"
```
When Terraform runs, it will automatically look for this file and use the values inside.

---

## **3. `*.auto.tfvars` File**
Now, imagine you have multiple notebooks, but one is special because it always comes first. That’s what an `*.auto.tfvars` file is. Terraform looks for files with `.auto.tfvars` and loads them automatically.

### Example:
Create a file named `myvars.auto.tfvars`:
```hcl
key = "auto-value"
availability_zone = "us-east-1a"
```
Terraform will load it without you needing to do anything extra.

---

## **4. `-var` Command-Line Flag**
Sometimes, you just want to shout out your answers instead of writing them down. Using the `-var` flag is like shouting out your variable values directly when you run Terraform.

### Example:
Run this command:
```bash
terraform apply -var="key=value"
```
Here:
- `key=value` is the variable and its value you’re providing.

---

## **5. `-var-file` Command-Line Flag**
Imagine you have a secret diary that you want to use only when needed. The `-var-file` flag lets you load variables from a specific file.

### Example:
Create a file called `myvars.tfvars`:
```hcl
key = "file-value"
type = "premium"
```
Run this command:
```bash
terraform apply -var-file="myvars.tfvars"
```
Terraform will use the values in that file.

---

### **How It All Comes Together**
- Use **environment variables** when you want to keep secrets outside the project.
- Use `terraform.tfvars` or `*.auto.tfvars` for values Terraform should automatically find.
- Use `-var` or `-var-file` when you want to specify values manually for a specific run.

---

### Example Scenario
Let’s say you’re building a treehouse:
- **Environment Variables:** You keep the secret treehouse design hidden in your room.
- **`terraform.tfvars`:** You write the list of materials (wood, nails) in your notebook.
- **`*.auto.tfvars`:** Your friend adds a notebook that automatically suggests where to buy the materials.
- **`-var`:** You quickly tell someone the size of the treehouse without writing it down.
- **`-var-file`:** You bring a special list with exact dimensions for this specific tree.

---




<!-- 

# environment var
## We can also provide the value using environement variables
`export TF_VAR_key=value`
```export TF_VAR_aws_instance_type=t2.micro```
## It is useful when we have to provide sensitive information

# terraform.tf_vars
## `.terraform.tfvars` is a file that defines variables and their values used in Terraform configurations, allowing you to customize your infrastructure settings.

## `.terraform.tfvars` file is indeed useful in testing. It allows you to define and manage variable values separately from your main configuration, making it easier to test different scenarios and configurations without modifying the core Terraform files. This is especially handy for running tests with different inputs and environments efficiently.

# *.auto.tfvars -->

<!-- 
terraform plan -var='ec2_config={v_size=50, v_type="gp2"}' -->