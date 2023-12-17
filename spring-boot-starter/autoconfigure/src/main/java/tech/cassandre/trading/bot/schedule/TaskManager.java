package tech.cassandre.trading.bot.schedule;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import tech.cassandre.trading.bot.schedule.handle.impl.AccountFluxHandle;
import tech.cassandre.trading.bot.schedule.handle.impl.CandleFluxHandle;
import tech.cassandre.trading.bot.schedule.handle.impl.TickerFluxHandle;
import tech.cassandre.trading.bot.schedule.handle.impl.TradeOrderFluxHandle;

import javax.annotation.Resource;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;


/**
 * 任务管理器.
 */
@Data
@RequiredArgsConstructor
public class TaskManager {

    private  AccountFluxHandle accountFluxHandle;

    private TickerFluxHandle tickerFluxHandle;

    private TradeOrderFluxHandle tradeOrderFluxHandle;

    private CandleFluxHandle candleFluxHandle;

    /**
     * 动态任务集合.CurrencyPeriod->Task.
     */
    private Set<CurrencyPeriod> currencyPeriods = ConcurrentHashMap.newKeySet();
    /**
     * 默认任务集合.
     */
    private  Set<Task> defaultTask = ConcurrentHashMap.newKeySet();

    /**
     * Constructor.
     * @param currencyPeriods
     */
    public TaskManager(Set<CurrencyPeriod> currencyPeriods) {
        this.currencyPeriods = currencyPeriods;
    }

    /**
     * getDefaultTask().
     * @return
     */
    public Set<Task> getDefaultTask(){
        defaultTask.add(new Task(1,"AccountFluxHandle","默认每一秒执行",accountFluxHandle));
        defaultTask.add(new Task(2,"TickerFluxHandle","默认每一秒执行",tickerFluxHandle));
        defaultTask.add(new Task(3,"TradeOrderFluxHandle","默认每一秒执行",candleFluxHandle));
        // 周期与cron之间的转化函数 TODO
        currencyPeriods.forEach(currencyPeriod->{
            candleFluxHandle.currencyPeriod = currencyPeriod;
            defaultTask.add(new Task(defaultTask.size()+1,currencyPeriod.getClass().getName(),"根据周期获取",candleFluxHandle));
        });

        return defaultTask;
    }

}
