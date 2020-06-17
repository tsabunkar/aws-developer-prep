# AWS KMS Management

- AWS Key Management Service (AWS KMS) is a managed service that makes it easy for you to create and control the encrytion keys used to encrypt your data.
- AWS KMS is integrated with other AWS services including, EBS, S3, Amazon Redshift, Amazon Elastic Transcode, Amazon WorkMail, Amazon Relation Database Service (Amazon RDS),and others to make it simple to encrypt your data with encryption keys that you manage
- Exam Tip
  - The Customer Master Key (CMK):
    - CMK
      - alias
      - creation date
      - description
      - key state
      - key material (either customer provided or AWS provided)
    - CMK Can Never be exported
  - Key Material Options:
    - Use KMS generated Key material
    - Your own key material

---

# KMS API Calls Exam Tips

- aws kms encrypt
- aws kms decrypt
- aws kms re-encrypt
- aws kms enable-key-rotation

---

# KMS Envelope Encryption

- Encryption: [./envelope-encry.png]
- Decryption: [./decrypt.png]
- The Customer Key
  - Customer Master Key used to decrypt the data key (envelop key)
  - Envelope Key is used to decrypt the data

---
