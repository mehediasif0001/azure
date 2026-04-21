

🔐 Azure Key Vault: Data Encryption & Decryption (RSA-4096)

This project demonstrates how to protect sensitive information using Azure Key Vault and RSA Cryptography. Instead of storing raw data, we encrypt it into a binary format that only the authorized Key Vault can decrypt.
📝 Step-by-Step Execution 

# Azure Portal

🏛️ Azure Portal Configuration (The Infrastructure Setup)

Before running CLI commands, the foundational security infrastructure was established via the Azure Portal.


![SS](https://github.com/mehediasif0001/azure/blob/main/Encrypt%20Decrypt%20file%20using%20Key%20Vault/images/Screenshot_1.png)


        1. Provisioning the Key Vault
        
            Vault Name: xfusion-21381
        
            Region: East US (Standard Tier).
        
            Soft-Delete: Enabled with a 7-day retention period to prevent accidental data loss.
        
             why?: This acts as our centralized security umbrella for managing cryptographic keys.
   

   ![SS](https://github.com/mehediasif0001/azure/blob/main/Encrypt%20Decrypt%20file%20using%20Key%20Vault/images/Screenshot_2.png)
   
![SS](https://github.com/mehediasif0001/azure/blob/main/Encrypt%20Decrypt%20file%20using%20Key%20Vault/images/Screenshot_5.png)
        3. Configuring Access Policies (The "Gatekeeper")
        
            Permission Model: Used the Vault Access Policy model.
        
            Assigned Roles: Granted Get, List, Encrypt, and Decrypt permissions to the specific Lab Identity.
        
             why?: Without these specific permissions, the CLI cannot call the Key Vault APIs to perform encryption/decryption,
            even if the user is an Owner.

![SS](https://github.com/mehediasif0001/azure/blob/main/Encrypt%20Decrypt%20file%20using%20Key%20Vault/images/Screenshot_3.png)
![SS](https://github.com/mehediasif0001/azure/blob/main/Encrypt%20Decrypt%20file%20using%20Key%20Vault/images/Screenshot_4.png)

        4. Generating the RSA Key
        
            Key Name: xfusion-key
        
            Key Type: RSA (Asymmetric encryption).
        
            Key Size: 4096-bit (High-strength security).
        
            why?: This 4096-bit key is the heart of the project. It ensures that the encryption is computationally impossible to crack without the private key held securely inside Azure's Hardware Security Modules (HSM).

   










# CLI 
![SS](https://github.com/mehediasif0001/azure/blob/main/Encrypt%20Decrypt%20file%20using%20Key%20Vault/images/Screenshot_6.png)



1. Prepare the Data (Base64 Encoding)


why?: Before sending data to Azure CLI, we encode it to Base64. This ensures that special characters or new lines in the file don't break the CLI command.

    base64 /root/SensitiveData.txt > /root/plaintext.64

2. Encrypt the Data (Locking the Vault)

why?:: We use the RSA-4096 key stored in Azure Key Vault to transform the plaintext into a scrambled binary format.

   Algorithm: RSA-OAEP (A highly secure industry-standard algorithm).

   Process: The Key Vault takes the string, applies the mathematical key, and returns an encrypted cipher.


    az keyvault key encrypt \
      --vault-name < your vault-name> \
      --name <your Key name> \
      --algorithm RSA-OAEP \
      --value $(cat /root/plaintext.64) \
      --query result -o tsv > /root/EncryptedData.bin

3. Decrypt the Data (Unlocking the Vault)

why?: To read the data again, we send the EncryptedData.bin back to the Key Vault. Since we have the Decrypt permission, the vault uses its private key to recover the original Base64 string.
Bash

      az keyvault key decrypt \
      --vault-name <vault name> \
      --name  <your Key name> \
      --algorithm RSA-OAEP \
      --value $(cat /root/EncryptedData.bin) \
      --query result -o tsv > /root/decrypted.64

4. Restore Original File (Decoding)

why?: Finally, we convert the Base64 string back to human-readable text.
Bash

    base64 -d /root/decrypted.64 > /root/DecryptedData.txt

🧠 Key Takeaways for DevOps Engineers

    Infrastructure: Key Vault must have Soft-Delete enabled for production safety.

    Identity: Access is managed via Access Policies (Get, List, Encrypt, Decrypt).

    Security: By using RSA-4096, we ensure that even if someone steals the EncryptedData.bin file, they cannot read it without access to the Azure Key Vault.
