package tech.cassandre.trading.bot.dto.web3;

import lombok.Data;
import org.knowm.xchange.currency.CurrencyPair;

import java.util.Date;

/**
 * candle stick search param
 * @Author Nozdormu
 */
@Data
public class MkCandleStickDTO {
    /**
     * k线周期
     */
    private long periodInSecs;
    /**
     * 交易所类型
     */
    private String exchangeType;
    /**
     * 查询交易对
     */
    private  CurrencyPair currencyPair;
    /**
     * 开始时间
     */
    private  Date startDate;
    /**
     * 结束时间
     */
    private  Date endDate;

}
