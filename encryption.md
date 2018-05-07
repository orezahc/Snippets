Ref : https://raymii.org/s/tutorials/Encrypt_and_decrypt_files_to_public_keys_via_the_OpenSSL_Command_Line.html

```
openssl rsautl -decrypt -inkey <.pem> -in /home/chao/archived.pwd.enc -out /home/chao/archived.pwd
openssl enc -d -aes-256-cbc -in /home/chao/archived.tar.gz.enc -out /home/chao/archived.tar.gz -pass file:/home/chao/archived.pwd
tar -xzvf /home/chao/archived.tar.gz 
```
