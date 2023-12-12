package tech.cassandre.trading.bot.util.mapper;

import org.knowm.xchange.web3Server.dto.web3.CandleStickDO;
import org.mapstruct.Mapper;
import tech.cassandre.trading.bot.dto.web3.CandleStickDTO;

@Mapper
public interface CandleStickMapper {
    // =================================================================================================================
    // XChange to DTO.
    default CandleStickDTO mapToCandleStickDTO(CandleStickDO source) {
        if (source != null) {
            return (CandleStickDTO) source;
        } else {
            return null;
        }
    }
}
