package tech.cassandre.trading.bot.service.web3Server;

import org.knowm.xchange.okex.dto.OkexResponse;
import tech.cassandre.trading.bot.dto.web3.CandleStickDO;
import tech.cassandre.trading.bot.dto.web3.MkCandleStickDTO;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.io.IOException;
import java.util.Set;

import static javax.ws.rs.core.MediaType.APPLICATION_JSON;

@Path("/market/history")
@Produces(APPLICATION_JSON)
public interface Web3Server {

    @POST
    @Path("/historyCandles")
    @Consumes(MediaType.APPLICATION_JSON)
    OkexResponse<Set<CandleStickDO>> getHistoryCandles(MkCandleStickDTO candleStickBO)
            throws IOException;
}
