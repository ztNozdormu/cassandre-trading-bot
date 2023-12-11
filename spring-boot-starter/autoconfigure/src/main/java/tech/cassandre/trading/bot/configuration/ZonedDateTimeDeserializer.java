package tech.cassandre.trading.bot.configuration;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

import java.io.IOException;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;


public class ZonedDateTimeDeserializer extends JsonDeserializer<ZonedDateTime> {
    /**
     * ZonedDateTime格式.
     */
    public static final String ZONED_DATE_TIME_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.SSSz";
    /**
     * Custom {@link ZonedDateTime} deserializer.
     *
     * @param jsonParser             for extracting the date in {@link String} format.
     * @param deserializationContext for the process of deserialization a single root-level value.
     * @return {@link ZonedDateTime} object of the date.
     * @throws IOException throws I/O exceptions.
     */
    @Override
    public ZonedDateTime deserialize(final JsonParser jsonParser, final DeserializationContext deserializationContext)
            throws IOException {

        return ZonedDateTime.parse(jsonParser.getText(), DateTimeFormatter.ofPattern(ZONED_DATE_TIME_FORMAT));
    }
}
