package tech.cassandre.trading.bot.batch;

import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.time.DateUtils;
import org.knowm.xchange.currency.CurrencyPair;
import org.springframework.context.ApplicationContext;
import tech.cassandre.trading.bot.dto.market.TickerDTO;
import tech.cassandre.trading.bot.dto.util.CurrencyPairDTO;
import tech.cassandre.trading.bot.dto.web3.CandleStickDO;
import tech.cassandre.trading.bot.dto.web3.MkCandleStickDTO;
import tech.cassandre.trading.bot.service.web3Server.Web3ServerHistoryDataService;
import tech.cassandre.trading.bot.strategy.CassandreStrategy;
import tech.cassandre.trading.bot.strategy.internal.CassandreStrategyInterface;
import tech.cassandre.trading.bot.util.base.batch.BaseFlux;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * CandlePeriod flux - push {@link TickerDTO}.
 * Two methods override from super class:
 * - getNewValues(): calling web3 service to retrieve candles from web3Server.
 * - saveValues(): not implemented as we don't store candles data in database.
 * To get a deep understanding of how it works, read the documentation of {@link BaseFlux}.
 */
@RequiredArgsConstructor
public class CandlePeriodFlux extends BaseFlux<CandleStickDO> {

    /** Application context. */
    private final ApplicationContext applicationContext;

    /** web3Server service. */
    private final Web3ServerHistoryDataService web3ServerHistoryDataService;
    @Override
    protected final Set<CandleStickDO> getNewValues() {
        // We retrieve the list of currency pairs asked by all strategies.
        // Some users coded a getRequestedCurrencyPairs() that returns different results.
        final LinkedHashSet<CurrencyPairDTO> requestedCurrencyPairs = applicationContext
                .getBeansWithAnnotation(CassandreStrategy.class)
                .values()
                .stream()
                .filter(Objects::nonNull)
                .map(object -> (CassandreStrategyInterface) object)
                .map(CassandreStrategyInterface::getRequestedCurrencyPairs)
                .flatMap(Set::stream)
                .collect(Collectors.toCollection(LinkedHashSet::new));
        // TODO 通过策略配置信息构造
        Date startDate = DateUtils.addDays(new Date(),-60);

        MkCandleStickDTO mkCandleStickDTO = new MkCandleStickDTO();
        mkCandleStickDTO.setCurrencyPair(CurrencyPair.BTC_USDT);
        mkCandleStickDTO.setExchangeType("okex");
        mkCandleStickDTO.setStartDate(startDate);
        mkCandleStickDTO.setEndDate(new Date());
        mkCandleStickDTO.setPeriodInSecs(15000);
        // We try to retrieve all tickers at once and if not working, one by one.
        // Get all tickers at once from market service if the method is implemented.
        return web3ServerHistoryDataService.getHistoryCandles(mkCandleStickDTO);
    }

}
