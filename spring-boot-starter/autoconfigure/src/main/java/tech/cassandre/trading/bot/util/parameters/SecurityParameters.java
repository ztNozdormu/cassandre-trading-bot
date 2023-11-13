package tech.cassandre.trading.bot.util.parameters;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.validation.annotation.Validated;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

/**
 * Parameters from application.properties.
 */
@Validated
@Getter
@Setter
@ToString
@EnableConfigurationProperties({SecurityParameters.class,
        SecurityParameters.Property.class})
@ConfigurationProperties(prefix = "cassandre.trading.jasypt.encryptor")
public class SecurityParameters {

    /** API passphrase. */
    @NotNull(message = "Security parameter required, password is not null")
    private String password;


    /** Modes. */
    @Valid
    private Property property = new Property();

    /** Exchange modes. */
    @Validated
    @Getter
    @Setter
    @ToString
    @ConfigurationProperties(prefix = "cassandre.trading.jasypt.encryptor.property")
    public static class Property {

        /** Set it to true to use the sandbox. */
        @NotNull(message = "Sandbox parameter required, set it to true to use the exchange sandbox")
        private String prefix;

        /** Set it to true to use the dry mode. */
        @NotNull(message = "Dry parameter required, set it to true to use the dry mode (simulated exchange)")
        private String suffix;

    }
}
