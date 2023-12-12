package tech.cassandre.trading.bot.dto.web3;

import lombok.Data;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.knowm.xchange.web3Server.dto.web3.CandleStickDO;
import tech.cassandre.trading.bot.dto.util.CurrencyPairDTO;

import java.util.Objects;

/**
 * CandleStickDO 扩展实现.
 */
@Data
public class CandleStickDTO extends CandleStickDO {

    /** Currency pair. */
    private CurrencyPairDTO currencyPairDTO;

    /**
     * 获取交易对对象.
     * @return CurrencyPairDTO
     */
    public CurrencyPairDTO getCurrencyPairDTO() {
        return new CurrencyPairDTO(super.getCurrencyPair());
    }

    /**
     * 重写等于函数.
     * @param o
     * @return
     */
    @Override
    public  boolean equals(final Object o) {
        if (this == o) {
            return true;
        }
        if (o == null) {
            return false;
        }
        CandleStickDTO that = (CandleStickDTO) o;
        return Objects.equals(getTsTime(), that.getTsTime());
    }

    /**
     * 重写等于哈希编码规则.
     * @return
     */
    @Override
    public final int hashCode() {
        return new HashCodeBuilder()
                .append(getTsTime())
                .toHashCode();
    }
}
