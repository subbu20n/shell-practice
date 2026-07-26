# Shell Scripting Concepts for DevOps

Welcome to **Shell Scripting Concepts for DevOps**

This repository is designed for DevOps engineers, sysadmins, and anyone seeking real-world, production-ready shell script examples. Here you'll find categorized scripts with practical use cases, covering essential automation tasks in Unix/Linux environments.

---

## 🚀 Features

- **Real-world scripts** for production and staging environments.
- **Categories:** User/process management, monitoring, backups, alerts, disk-usage, cpu-usage, crontab scheduling, and more.
- **Well-documented examples** with explanations and sample outputs.
- **Best practices** for DevOps automation using Bash shell scripting.

---

## 🗂️ Repository Structure

```
.
├── user_management/
│   ├── add_user.sh
│   ├── remove_user.sh
├── process_management/
│   ├── monitor_process.sh
├── monitoring/
│   ├── disk_check.sh
│   ├── cpu_usage.sh
├── backup/
│   ├── backup_files.sh
│   ├── restore_files.sh
├── alerts/
│   ├── disk_alert.sh
│   ├── service_alert.sh
├── crontab/
│   ├── schedule_backup.sh
├── README.md
```

---

## 🛠️ Prerequisites

- Linux/Unix environment (tested on Ubuntu/CentOS)
- Bash shell (version 4.x or higher recommended)
- Basic system access and permissions (some scripts require `sudo`)
- Recommended utilities: [`jq`](https://stedolan.github.io/jq/), [`curl`](https://curl.se/), [`mailx`](https://linux.die.net/man/1/mailx) for alerting scripts

---

## 📦 Installation & Usage

Clone the repository:
```sh
git clone https://github.com/subbu20n/shell-practice.git
cd shell-scripting-concepts-for-devops
```

Make a script executable and run it:
```sh
chmod +x monitoring/disk_check.sh
./monitoring/disk_check.sh
```

---

## 🖨️ Sample Output

Example output from `monitoring/disk_check.sh`:
```
[INFO] Disk Usage on /dev/xvda1: 67% (Threshold: 80%)
[OK] Sufficient disk space available.
```

---

## 💡 Real-World Use Cases

- **Monitoring:** Alerting on high disk or CPU usage, checking memory consumption.
- **User Management:** Automating user creation/removal, permissions management.
- **Backups:** Scheduling and verifying file backups/restores.
- **Crontab Automation:** Automating recurring jobs (backups, cleanup, alerts).
- **Alerts:** Email/SMS notifications on critical events.

---

## 🛡️ Troubleshooting

- Ensure scripts have execution permissions (`chmod +x script.sh`).
- Some scripts require root privileges; use `sudo` as needed.
- For alert scripts, configure SMTP/mail on your server.
- Check shebang (`#!/bin/bash`) is present at the top of your scripts.

---

## 🤝 Contributing

Contributions, script improvements, and new use cases are welcome.

1. Fork this repository.
2. Create a new branch (`feature/your-script`).
3. Add your script(s) in the appropriate folder with documentation.
4. Create a pull request describing your changes.

Please follow naming conventions and comment your code for clarity.

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 👤 Author

** SUBBU **
- [GitHub](https://github.com/subbu20n)
- [LinkedIn](https://www.linkedin.com/in/subbarayudu-nandyala/)


---

*Happy scripting and automating*