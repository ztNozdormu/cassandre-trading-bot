package tech.cassandre.trading.bot.service.web3Server;

import tech.cassandre.trading.bot.dto.web3.CandleStickDO;
import tech.cassandre.trading.bot.dto.web3.MkCandleStickDTO;

import java.util.Set;

public interface Web3ServerHistoryDataService {

//    /**
//     * Get BarSeries
//     * @param candleStickDTO
//     * @return
//     */
//    BarSeries getBarSeries(MkCandleStickDTO candleStickDTO) throws IOException;

    /**
     * getHistoryCandles
     * @param candleStickDTO
     * @return
     */
    Set<CandleStickDO> getHistoryCandles(MkCandleStickDTO candleStickDTO);
}
