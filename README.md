# 🛠️ cloudpunchr-tools

**Offensive cloud security tools for testing and exploiting common misconfigurations — built for red team & training labs.**

---

## 📦 Included Tools

| Tool Name       | Description                                           |
|----------------|-------------------------------------------------------|
| `s3-exploiter`  | Scan, enumerate, and exploit misconfigured S3 buckets |
| `dns-enum`      | Lightweight DNS reconnaissance & zone transfer tool   |
| `coming-soon`   | IAM exploit chains, SSRF triggers, and more           |

---

## 📁 Repository Structure

```bash
cloudpunchr-tools/
├── s3-exploiter/         # S3 bucket enumeration and exploitation tools
│   └── README.md
├── dns-enum/             # DNS recon and zone transfer scripts
│   └── README.md
├── coming-soon/          # Placeholder for future IAM/SSRF/etc tools
│   └── README.md
├── writeups/             # HTB/THM/TCM walkthroughs with AI summaries
│   ├── HTB_Blue/
│   │   └── README.md
├── README.md             # This README
```

---

## 🔧 Tool: S3 Exploiter (`s3-exploiter/README.md`)

### 🔍 Overview
This Python-based tool helps penetration testers identify and exploit insecure S3 buckets in AWS. Built for red team training and CTF-style cloud labs.

### ✨ Features
- Brute-force bucket names from a wordlist
- Detect public read/write permissions
- Upload/download accessible files
- Support for recursive downloads and verbose logging

### 🚀 Usage
```bash
python3 s3_exploiter.py --bucket-name mytargetbucket
```

### 📦 Sample Options
```bash
--bucket-list buckets.txt  # Provide list of bucket names
--scan                     # Check bucket permissions
--download                 # Download readable contents
--upload file.txt          # Attempt file upload
```

### 📸 Demo Screenshot
![Demo](../s3_exploiter_screenshot.png)

### 🔧 Requirements
```bash
pip install boto3 requests
```

> ⚠️ Use responsibly. Educational & authorized testing only.

---

## 🌐 Tool: DNS Enum (`dns-enum/README.md`)

### 🔍 Overview
Simple DNS reconnaissance and zone transfer script to identify misconfigurations or exposed records.

### Features
- Zone transfer attempt
- Subdomain enumeration via dictionary

### Example
```bash
python3 dns_enum.py --domain example.com --wordlist subdomains.txt
```

---

## 🧠 Writeup Template (HTB, THM, etc.)

### Example: `writeups/HTB_Blue/README.md`

```markdown
# 💻 HTB Blue Writeup

**Box:** Blue
**OS:** Windows
**Difficulty:** Easy

---

## 🔍 Enumeration
```bash
nmap -A 10.10.10.40
```

## ⚔️ Exploitation
Used `ms17-010` EternalBlue exploit via Metasploit:
```bash
msfconsole
use exploit/windows/smb/ms17_010_eternalblue
```

## 🏁 Flags
- `User.txt`: ✅
- `Root.txt`: ✅

## 🧠 Lessons Learned
- SMB null session
- Legacy vulnerabilities
```

---

## 🗂️ Usage Guidelines
Each folder contains a `README.md` for that tool or walkthrough. Recruiters, students, and red teamers can explore them individually.

---

## 👨‍💻 Author
**David Cox**  
GitHub: [@siestakeydbc](https://github.com/siestakeydbc)  
Domain: [cloudpuncher.dev](https://cloudpuncher.dev)  
Twitter: [@dcpentester](https://twitter.com/dcpentester)

---

## ⚠️ Disclaimer
These tools and walkthroughs are for educational use only. Use responsibly and with explicit permission.
