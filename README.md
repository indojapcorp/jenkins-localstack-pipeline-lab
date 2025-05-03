localstack start -d
brew services start jenkins-lts

brew services restart jenkins-lts

brew services stop jenkins-lts




Here’s a **step-by-step guide** to setting up a **new Jenkins pipeline job** that points to your Git repository containing a `Jenkinsfile`.

---

### ✅ Prerequisites

* Jenkins is running (e.g., via `http://localhost:8080`)
* You have the initial Jenkins setup complete (admin password set, plugins installed)
* Your Git repository (local or remote like GitHub) contains the `Jenkinsfile` at the root

---

### 🧭 Step-by-Step Instructions

#### 1. **Log in to Jenkins**

* Open your browser and go to `http://localhost:8080`
* Log in using your Jenkins admin credentials

---

#### 2. **Create a New Pipeline Job**

* Click **“New Item”** on the left sidebar
* Enter a name for your job (e.g., `localstack-pipeline`)
* Select **“Pipeline”**
* Click **“OK”**

---

#### 3. **Configure the Pipeline Job**

##### 🛠 General Section (optional)

* Add a description like: *"Pipeline to provision AWS (LocalStack) infrastructure and deploy app"*

##### 🔗 Pipeline → Definition

* Under **Definition**, choose **“Pipeline script from SCM”**

##### 🔗 SCM Configuration

* **SCM**: Choose **Git**
* **Repository URL**: Enter the URL to your Git repo (e.g., `https://github.com/your-user/jenkins-lab.git`)
* **Credentials**: Add Git credentials if the repo is private (click "Add" > enter username/password or SSH)
* **Branch**: e.g., `main` or `master`

##### 📄 Script Path

* Set **Script Path** to `Jenkinsfile` (if it's at the root of the repo)

---

#### 4. **Save the Job**

* Click **“Save”** at the bottom

---

#### 5. **Run the Pipeline**

* You will be taken to the job dashboard
* Click **“Build Now”**
* Watch the stages execute in the **Blue Ocean UI** (if installed) or in the classic **Console Output**

---

### ✅ Expected Outcome

* Jenkins checks out your Git repository
* It runs the steps defined in the `Jenkinsfile`:

  * Initializes and applies Terraform to LocalStack
  * Uploads/deploys your app artifacts to AWS-like resources simulated in LocalStack

---

Would you like help setting up a sample public GitHub repo to test this directly?


----
git init
git add .
git commit -m "Initial commit: Jenkins + LocalStack CI/CD demo"

Step 6: Create a Remote GitHub Repository
Go to GitHub

Click “New”

Name the repo: jenkins-localstack-pipeline-lab

git remote add origin https://github.com/indojapcorp/jenkins-localstack-pipeline-lab.git
git branch -M main
git push -u origin main