package tech.cassandre.trading.bot.service;

import lombok.RequiredArgsConstructor;
import org.knowm.xchange.Exchange;
import tech.cassandre.trading.bot.dto.util.CurrencyPairDTO;
import tech.cassandre.trading.bot.util.base.service.BaseService;

import java.util.LinkedHashSet;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * Exchange service - XChange implementation of {@link ExchangeService}.
 */
@RequiredArgsConstructor
public class ExchangeServiceXChangeImplementation extends BaseService implements ExchangeService {

    /** XChange service. */
    private final Exchange exchange;

    @Override
    @SuppressWarnings("checkstyle:DesignForExtension")
    public Set<CurrencyPairDTO> getAvailableCurrencyPairs() {
        logger.debug("Retrieving available currency pairs");
        return exchange.getExchangeMetaData().getInstruments()
                .keySet()
                .stream()
                .peek(cp -> logger.debug(" - {} available", cp))
                .map(CURRENCY_MAPPER::mapToCurrencyPairDTO)
                .collect(Collectors.toCollection(LinkedHashSet::new));
    }

}
