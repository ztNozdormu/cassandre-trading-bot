package tech.cassandre.trading.bot.service.web3Server;

import org.ta4j.core.BarSeries;
import org.ta4j.core.BaseBarSeries;
import tech.cassandre.trading.bot.dto.web3.CandleStickDO;
import tech.cassandre.trading.bot.dto.web3.MkCandleStickDTO;

import java.io.IOException;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.stream.Collectors;

import static java.util.Collections.EMPTY_SET;

public class Web3ServerHistoryDataServiceImpl implements Web3ServerHistoryDataService{

    private Web3Server web3Server;
    public Web3ServerHistoryDataServiceImpl(Web3Server web3Server) {
       this.web3Server = web3Server;
    }

//    @Override
//    public BarSeries getBarSeries(MkCandleStickDTO candleStickDTO) {
//        BarSeries series = new BaseBarSeries();
//        try{
//            Set<CandleStickDO> candleStickDOSet = getHistoryCandles(candleStickDTO);
//            candleStickDOSet = candleStickDOSet.stream().sorted(Comparator.comparing(CandleStickDO::getTsTime)).collect(Collectors.toCollection(LinkedHashSet::new));
//            candleStickDOSet.forEach(candleStickDO -> series.addBar(CandleBaseBarMapper.INSTANCE.mapToBaseBar(candleStickDO)));
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//
//        return series;
//    }

    @Override
    public Set<CandleStickDO> getHistoryCandles(MkCandleStickDTO candleStickDTO) {
        Set<CandleStickDO> candleStickDOSet;
        try {
            candleStickDOSet = web3Server.getHistoryCandles(candleStickDTO).getData();
            candleStickDOSet = candleStickDOSet.stream().sorted(Comparator.comparing(CandleStickDO::getTsTime)).collect(Collectors.toCollection(LinkedHashSet::new));
        } catch (IOException e) {
            candleStickDOSet = EMPTY_SET;
        }
        return candleStickDOSet;
    }

}
