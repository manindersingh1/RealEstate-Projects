using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;

namespace Property_Cryptography
{
  public  class Cryptography
    {
        byte[] mKey = new byte[8];
        byte[] mIV = new byte[8];
        public string MyKey
        {
            get
            {
                return "[2014]MiltonReporting";
            }
        }
        DESCryptoServiceProvider mobjCryptoService = new DESCryptoServiceProvider();

        public String Encrypt(string Source)
        {

            string Key = MyKey;

            byte[] bytIn = Encoding.UTF8.GetBytes(Source);
            // System.Text.ASCIIEncoding.ASCII.GetBytes(Source) 
            // create a MemoryStream so that the process can be done without I'O files 
            System.IO.MemoryStream ms = new System.IO.MemoryStream();

            if (!(haskKey(Key)))
            {
                //Error. Fail to generate key for encryption 
                return "";
            }

            // set the private key 
            mobjCryptoService.Key = mKey;
            mobjCryptoService.IV = mIV;

            // create an Encryptor from the Provider Service instance 
            ICryptoTransform encrypto = mobjCryptoService.CreateEncryptor();

            // create Crypto Stream that transforms a stream using the encryption 
            CryptoStream cs = new CryptoStream(ms, encrypto, CryptoStreamMode.Write);

            // write out encrypted content into MemoryStream 
            cs.Write(bytIn, 0, bytIn.Length);
            cs.FlushFinalBlock();

            // get the output and trim the '\0' bytes 
            byte[] bytOut = ms.GetBuffer();

            // convert into Base64 so that the result can be used in xml 

            return System.Convert.ToBase64String(bytOut, 0, Convert.ToInt32(ms.Length));
        }
        public String Decrypt(string Source)
        {

            string Key = MyKey;
            //' convert from Base64 to binary 
            byte[] bytIn = System.Convert.FromBase64String(Source);
            //' create a MemoryStream with the input 
            System.IO.MemoryStream ms = new System.IO.MemoryStream(bytIn, 0, bytIn.Length);

            if (!(haskKey(Key)))
            {
                //Error. Fail to generate key for decryption 
                return "";
            }

            //' set the private key 
            mobjCryptoService.Key = mKey;
            mobjCryptoService.IV = mIV;

            //' create a Decryptor from the Provider Service instance 
            ICryptoTransform encrypto = mobjCryptoService.CreateDecryptor();

            //' create Crypto Stream that transforms a stream using the decryption 
            CryptoStream cs = new CryptoStream(ms, encrypto, CryptoStreamMode.Read);

            //' read out the result from the Crypto Stream 
            System.IO.StreamReader sr = new System.IO.StreamReader(cs);
            return sr.ReadToEnd();
        }
        private bool haskKey(string strKey)
        {
            try
            {
                //Convert Key to byte array 
                byte[] bp = new byte[strKey.Length];
                UTF8Encoding aEnc = new UTF8Encoding();
                //Dim aEnc As ASCIIEncoding = New ASCIIEncoding() 
                aEnc.GetBytes(strKey, 0, strKey.Length, bp, 0);

                //Hash the key using SHA1 
                SHA1CryptoServiceProvider sha = new SHA1CryptoServiceProvider();
                byte[] bpHash = null;
                int i = 0;

                bpHash = sha.ComputeHash(bp);

                //use the low 64-bits for the key value 
                for (i = 0; i <= 7; i++)
                {
                    mKey[i] = bpHash[i];
                }

                for (i = 8; i <= 15; i++)
                {
                    mIV[i - 8] = bpHash[i];
                }


                return true;
            }
            catch (Exception ex)
            {
                return false;

            }
        }
    }
}
