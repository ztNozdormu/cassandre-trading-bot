package tech.cassandre.trading.bot.schedule;


import lombok.Data;
import lombok.RequiredArgsConstructor;
import tech.cassandre.trading.bot.dto.util.CurrencyDTO;

/**
 * 资产周期信息.
 */
@Data
@RequiredArgsConstructor
public class CurrencyPeriod {
    /**
     * 资产信息.
     */
    private CurrencyDTO currencyDTO;
    /**
     * 周期.
     */
    private long period;
}
