# Sample Project
## 🚨 Not for Production Purpose 🚨
## Focus on the Nginx Deployment

### Steps

1. **Check the Disk Usage**
   - `df -h`

2. **Confirm to start this Operation or not?**

3. **Choose the package name that you want to install**

4. **Install the Package**
   - `sudo apt-get install <package-name>`
   - Replace `<package-name>` with the chosen package.

5. **Download the source code from the Repo**
   - `git clone https://github.com/your-repo.git`
   - 🚨 **Avoid the "Already exist" Error** 🚨

6. **Take Backup the existing file to "/tmp"**
   - `mv /var/www/html/* /tmp/`
   - 🚨 **Avoid the File duplication** 🚨

7. **Deploy the production file to "/var/www/html/"**
   - `cp -r your-repo/* /var/www/html/`

8. **Restart the related service**
   - `sudo systemctl restart nginx`
