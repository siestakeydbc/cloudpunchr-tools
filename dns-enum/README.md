# 🧠 dns-enum

**dns-enum** is a lightweight command-line tool designed for ethical hackers to brute-force DNS subdomains and enumerate records in real time.

> ⚠️ This tool is for **educational use only** on authorized infrastructure.

---

## 🚀 Features

- 🧠 Brute-force subdomains using a wordlist
- 🌐 Enumerate DNS records (A, AAAA, CNAME, MX, NS, TXT)
- 📁 Save findings in a structured text format
- 🔍 Support for wildcard filtering and recursive lookups
- 🐧 Compatible with Kali Linux, Parrot, and other pentest distros

---

## 🛠 Installation

```bash
git clone https://github.com/siestakeydbc/cloudpunchr-tools.git
cd cloudpunchr-tools/dns-enum
chmod +x dns-enum.sh
```

> 💡 Optional: Create a Python virtual environment or run in Docker for isolation.

---

## 💡 Usage

```bash
./dns-enum.sh -d example.com -w wordlists/subdomains.txt
```

---

### 🧪 Sample Test Setup

To create a quick wordlist for local testing:

```bash
echo -e "www\nmail\ndev\ntest\nvpn" > subdomains.txt
```

This will generate a 5-entry file called `subdomains.txt`.

---

### ▶️ Example Run

Basic usage with the test wordlist:

```bash
./dns-enum.sh -d example.com -w subdomains.txt
```

**Simulated Output:**
```
[*] Starting DNS enumeration for domain: example.com
[+] Found: www.example.com [A Record: 93.184.216.34]
[+] Found: mail.example.com [MX Record: mail.example.com]
[+] Found: dev.example.com [A Record: 93.184.216.34]
[!] No DNS records found for test.example.com
[!] No DNS records found for vpn.example.com
[*] Scan complete. Results saved to output/example.com_results.txt
```

---

## 📦 Output

All results are saved to an `output/` folder with timestamped filenames for review or reporting.

---

## 🧱 Dependencies

- `dig`, `host`, or `nslookup`
- Works out of the box on most Linux distros

---

## 🧩 Future Enhancements

- ✅ Add JSON output support
- ✅ Integrate DNS over HTTPS (DoH) support
- ✅ Add threading for large-scale brute-force speed

---

## 👨‍💻 Author

**cloudpunchr** — [GitHub](https://github.com/siestakeydbc) | [cloudpuncher.dev](https://cloudpuncher.dev)

---

## 🔐 Legal Disclaimer

This tool is intended for **authorized testing only**. Unauthorized scanning or enumeration is strictly prohibited and may be illegal.
