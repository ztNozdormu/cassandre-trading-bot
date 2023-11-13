package tech.cassandre.trading.bot.test.sm;

import cn.hutool.crypto.SmUtil;
import org.jasypt.encryption.StringEncryptor;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Cassandre trading bot JasyptTest.
 */
@SpringBootApplication(scanBasePackages={"tech.cassandre.trading.bot"})
public class SmTest {

    @Autowired
    private StringEncryptor encryptor;

    @Test
    public void getSm3() {
        String password = "123456789";
        String passwordEn = SmUtil.sm3(password);
        System.out.println(passwordEn);
    }
}
