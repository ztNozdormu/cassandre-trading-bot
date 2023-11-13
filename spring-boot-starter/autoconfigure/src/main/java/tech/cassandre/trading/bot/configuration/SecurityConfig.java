package tech.cassandre.trading.bot.configuration;

import lombok.RequiredArgsConstructor;
import org.jasypt.encryption.StringEncryptor;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import tech.cassandre.trading.bot.util.parameters.SecurityParameters;

@Configuration
@EnableConfigurationProperties(SecurityParameters.class)
@RequiredArgsConstructor
public class SecurityConfig {

    /** Security parameters. */
    private final SecurityParameters securityParameters;

    @Bean("jasyptStringEncryptor")
    public StringEncryptor stringEncryptor() {
        StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
        encryptor.setAlgorithm("PBEWithMD5AndDES");
        encryptor.setPassword(securityParameters.getPassword());
        return encryptor;
    }
}
