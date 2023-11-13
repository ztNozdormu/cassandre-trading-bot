package tech.cassandre.trading.bot.test.jasypt;

import org.jasypt.encryption.StringEncryptor;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Cassandre trading bot JasyptTest.
 */
@SpringBootApplication(scanBasePackages={"tech.cassandre.trading.bot"})
public class JasyptTest {

    @Autowired
    private StringEncryptor encryptor;
    @Test
    public void getPass() {
        String username = encryptor.encrypt("18728474132");
        String passphrase = encryptor.encrypt("@He1254984260ro");
        String key = encryptor.encrypt("bdbb3fbc-0947-4ac9-85c1-1f746ac7621c");
        String secret = encryptor.encrypt("953A32604F43CCBD1A65E943E617A957");
        System.out.println("username : " + username);
        System.out.println("passphrase : " + passphrase);
        System.out.println("key : " + key);
        System.out.println("secret: " + secret);
    }
}
