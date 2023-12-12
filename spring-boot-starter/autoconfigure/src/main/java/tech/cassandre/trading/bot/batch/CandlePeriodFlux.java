package tech.cassandre.trading.bot.batch;

import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.time.DateUtils;
import org.knowm.xchange.currency.CurrencyPair;
import org.knowm.xchange.web3Server.dto.web3.CandleStickDO;
import org.knowm.xchange.web3Server.service.Web3ServerMarketDataService;
import org.knowm.xchange.web3Server.service.params.MkCandleStickDTO;
import org.springframework.context.ApplicationContext;
import tech.cassandre.trading.bot.dto.market.TickerDTO;
import tech.cassandre.trading.bot.dto.util.CurrencyPairDTO;
import tech.cassandre.trading.bot.dto.web3.CandleStickDTO;
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
public class CandlePeriodFlux extends BaseFlux<CandleStickDTO> {

    /** Application context. */
    private final ApplicationContext applicationContext;

    /** web3Server service. */
    private final Web3ServerMarketDataService web3ServerMarketDataService;
    /** 默认查询时间. */
    private static final int  S_TIME = -60;
    /** 默认查询周期. */
    private static final int  S_PERIOD = 15000;
    @Override
    protected final Set<CandleStickDTO> getNewValues() {
        // TODO 参数进一步扩展 固定参数 和 动态参数
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

        Date startDate = DateUtils.addDays(new Date(), S_TIME);

        MkCandleStickDTO mkCandleStickDTO = new MkCandleStickDTO();
        mkCandleStickDTO.setCurrencyPair(CurrencyPair.BTC_USDT);
        mkCandleStickDTO.setExchangeType("okex");
        mkCandleStickDTO.setStartDate(startDate);
        mkCandleStickDTO.setEndDate(new Date());
        mkCandleStickDTO.setPeriodInSecs(S_PERIOD);
        // We try to retrieve all tickers at once and if not working, one by one.
        // Get all tickers at once from market service if the method is implemented.
        Set<CandleStickDO> candleStickDOS = web3ServerMarketDataService.getHistoryCandle(mkCandleStickDTO);

        return candleStickDOS.stream().map(CANDLE_STICK_MAPPER::mapToCandleStickDTO).collect(Collectors.toSet());
    }

}
