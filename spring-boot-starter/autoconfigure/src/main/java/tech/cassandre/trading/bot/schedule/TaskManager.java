package tech.cassandre.trading.bot.schedule;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
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
@Component
@RequiredArgsConstructor
public class TaskManager {
    /**
     * accountFluxHandle对象注入.
     */
    @Resource
    private  AccountFluxHandle accountFluxHandle;
    /**
     * tickerFluxHandle对象注入.
     */
    @Resource
    private  TickerFluxHandle tickerFluxHandle;
    /**
     * tradeOrderFluxHandle对象注入.
     */
    @Resource
    private  TradeOrderFluxHandle tradeOrderFluxHandle;
    /**
     * candleFluxHandle对象注入.
     */
    @Resource
    private  CandleFluxHandle candleFluxHandle;

    /**
     * 动态任务集合.CurrencyPeriod-> Task.
     */
    private Set<CurrencyPeriod> currencyPeriods = ConcurrentHashMap.newKeySet();
    /**
     * 默认任务集合.
     */
    private  Set<Task> defaultTask = ConcurrentHashMap.newKeySet();
    /**
     * 默认任务起始索引.
     */
    private static final int DEFAULT_INDEX = 1;
//   /**
//     * Constructor.
//     */
//    public TaskManager(Set<CurrencyPeriod> currencyPeriods) {
//        this.currencyPeriods = currencyPeriods;
//    }

    /**
     * getDefaultTask().
     * @return Set<Task>
     */
    public Set<Task> getDefaultTask() {
        defaultTask.add(new Task(DEFAULT_INDEX, "AccountFluxHandle", "0/1 * * * * ?", accountFluxHandle));
        defaultTask.add(new Task(DEFAULT_INDEX + 1, "TickerFluxHandle", "0/1 * * * * ?", tickerFluxHandle));
        defaultTask.add(new Task(DEFAULT_INDEX + 2, "TradeOrderFluxHandle", "0/1 * * * * ?", tradeOrderFluxHandle));
        // 周期与cron之间的转化函数 TODO
        currencyPeriods.forEach(currencyPeriod-> {
            candleFluxHandle.setCurrencyPeriod(currencyPeriod);
            defaultTask.add(new Task(defaultTask.size() + 1, currencyPeriod.getClass().getName(), "根据周期获取", candleFluxHandle));
        });


        return defaultTask;
    }

}
