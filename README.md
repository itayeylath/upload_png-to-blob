# Azure Blob Upload Script — Setup Guide

## Requirements

Before running the script, make sure the following are installed and configured.

---

# 1. macOS / Linux Terminal

The script runs in a Bash terminal.

macOS already includes Terminal.app.

---

# 2. Install Azure CLI

### macOS (Homebrew)

```bash
brew install azure-cli
```

### Verify installation

```bash
az --version
```

You should see version information.

---

# 3. Login to Azure

Before using the script, authenticate with Azure:

```bash
az login
```

A browser window will open for authentication.

If working with a specific tenant:

```bash
az login --tenant "<TENANT_ID>" --scope "https://storage.azure.com/.default"
```

Example:

```bash
az login --tenant "e4395c39-4f76-439e-8fab-ac84552ecc4d" --scope "https://storage.azure.com/.default"
```

---

# 4. Make Sure You Have Permissions

The Azure user must have access to the storage account.

Recommended roles:

* Storage Blob Data Contributor
  or
* Storage Blob Data Owner

on the relevant Storage Account.

---

# 5. Save the Script

Create the script file:

```bash
touch upload_png.sh
```

Paste the script into the file:

```bash
nano upload_png.sh
```

Save and exit:

```text
CTRL + O
ENTER
CTRL + X
```

---

# 6. Make the Script Executable

```bash
chmod +x upload_png.sh
```

---

# 7. Run the Script

Example:

```bash
./upload_png.sh \
"/Users/username/Desktop/image.png" \
folder1 folder2 folder3
```

---

# 8. What the Script Does

The script uploads the same PNG file into multiple virtual folders inside the Azure Blob container.

Example result inside Blob Storage:

```text
folder1/image.png
folder2/image.png
folder3/image.png
```

---

# 9. Troubleshooting

## Authentication Expired

If you see:

```text
AADSTS700082
```

Run:

```bash
az logout
az login
```

---

## Permission Errors

If you see:

```text
AuthorizationPermissionMismatch
```

Your Azure user does not have sufficient Blob Storage permissions.

---

## Verify Blob Access

Test access with:

```bash
az storage container list \
  --account-name shopperaicatalog \
  --auth-mode login \
  --output table
```

---

# 10. Current Configuration

Storage Account:

```text
shopperaicatalog
```

Container:

```text
supplier-products
```
