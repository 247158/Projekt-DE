Member List and their role: 
Oleinik Ruslan - Writing code and programming Nexys A7-50t 
Pavlov Ivan - Writing code and simulation it (Caesar_cipher.vhd and bin2seg.vhd)

Project: Topic 5: Implementation of Basic Ciphers

Description: This project aims to demonstrate various simple ciphers, such as the Vernam Cipher, 
Caesar Cipher, Atbash Cipher, and potentially others, using basic logic gates and flip-flops on 
the Nexys A7 FPGA board. Each cipher enabling users to input plaintext messages and observe the 
resulting ciphertext generated by the encryption process. Buttons and switches can serve as input 
devices for users to input plaintext messages and control the encryption/decryption process. 
LEDs can provide visual feedback on the status of the encryption/decryption process, indicating ready 
to receive input, encryption/decryption in progress, and complete. The 7-segment display shows the 
ciphertext or plaintext output. 

Caesar cipher: A short description
In cryptography, a Caesar cipher, also known as Caesar's cipher, the shift cipher, Caesar's code, or Caesar shift, 
is one of the simplest and most widely known encryption techniques. It is a type of substitution cipher in which each letter 
in the plaintext is replaced by a letter some fixed number of positions down the alphabet. For example, with a left shift of 3, 
D would be replaced by A, E would become B, and so on. The method is named after Julius Caesar, who used it in his private correspondence

How it works:

To encrypt, each number is shifted by a specific number of positions (e.g., 3 positions).
1 becomes 4, 2 becomes 5, 6 becomes 9.
To decrypt, the number is shifted back in the opposite direction.
Why it's easy to break:

The Caesar cipher is easy to break due to its simplicity.

Example:

Encrypting "12345" with a shift of 3: "45678"
Decrypting: "12345"

%% in progress

Vernam cipher: A short description

Vernam Cipher is a method of encrypting alphabetic text. It is one of the Substitution techniques for converting plain text into cipher text. 
In this mechanism, we assign a number to each character of the Plain-Text, like (a = 0, b = 1, c = 2, … z = 25). 
Method to take key: In the Vernam cipher algorithm, we take a key to encrypt the plain text whose length should be equal to the length of the plain text. 

Encryption Algorithm
Assign a number to each character of the plain text and the key according to alphabetical order. 
Bitwise XOR both the number (Corresponding plain-text character number and Key character number). 
Subtract the number from 26 if the resulting number is greater than or equal to 26, if it isn’t then leave it.

%%



![image](https://github.com/247158/Projekt-DE/assets/165295428/efc83327-0c19-4fdd-b6c0-d6fbda8d5b79)

![image](https://github.com/247158/Projekt-DE/assets/165295428/2959de3d-1671-495c-95c1-08f49e22a337)

![image](https://github.com/247158/Projekt-DE/assets/165295428/7410a1da-13fb-4f63-b917-8903b8434400)


caesar_tb
![image](https://github.com/247158/Projekt-DE/assets/165295428/d0fda15d-2fdb-4985-b0f7-6a51747e6341)





